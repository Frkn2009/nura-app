# VOXELITH — Bir Kullanıcının Maksimum Maliyeti (3 Eylül 2026)

Bu doküman, bugün gerçek API'lere bağlanan üç Edge Function'ın (`chat`,
`tts`, `ai-feedback`) birim maliyetini ve bir Plus kullanıcısının bize
ayda **en fazla** ne kadara mal olabileceğini hesaplar. Kaynak: Anthropic
ve ElevenLabs'ın 3 Eylül 2026 itibariyle güncel fiyat listeleri (web
araştırması, sohbet geçmişinde kaynak linkleri var).

## 1. Birim maliyetler

| Operasyon | Sağlayıcı/model | Girdi | Çıktı | Maliyet/çağrı |
|---|---|---|---|---|
| `ai-feedback` (cümle geri bildirimi) | Claude Sonnet 5 ($2/$10 per MTok) | ~290 tok | ~180 tok | **≈ $0.0024** |
| `ai-feedback` (senaryo üretimi) | Claude Sonnet 5 | ~280 tok | ~400 tok | ≈ $0.0046 |
| `chat` (canlı sohbet turu) | Claude Haiku 4.5 ($1/$5 per MTok) | ~500 tok | ~120 tok | **≈ $0.0011** |
| `tts` (bir cümle oynatma) | ElevenLabs `eleven_v3`, ~45 karakter, $0.10/1000 karakter (overage) | — | — | **≈ $0.0045** |

Not: ElevenLabs $0.10/1k karakter rakamı **plan aşımı (overage)** fiyatı —
yani "en kötü durum" varsayımı. Aylık paket kotası içinde kalınırsa gerçek
marjinal maliyet daha düşük, ama "maksimum maliyet" sorusu için doğru
referans overage fiyatıdır.

## 2. Bugüne kadarki durum: sınır yoktu

Üç fonksiyon da yalnızca "oturum açık mı" ve (tts/chat için) "Plus mı"
kontrolü yapıyordu — **hiçbirinde günlük/aylık üst sınır yoktu.**
`UserProfile.speakAllowance`, Plus kullanıcılar için pratikte sınırsız
konuşma süresi tanımlıyor (`isPlus ? 3600 : ...` — 1 saatlik "gösterim"
değeri, gerçek bir tavan değil). Bu, **teorik maksimum maliyetin
sınırsız** olduğu anlamına geliyordu — bir kullanıcı (kasıtlı ya da
yoğun kullanımla) günde yüzlerce çağrı yapabilirdi.

**Bu oturumda düzeltildi:** `supabase/migrations/20260903120001_ai_usage_daily_cap.sql`
ile `ai_usage_daily` tablosu + `try_consume_ai_usage()` RPC'si eklendi, her
üç fonksiyon da artık çağrı öncesi bu sınırı kontrol ediyor. **3 Eylül'de
ikinci bir tur sıkılaştırma daha yapıldı** (aşağıdaki tablo güncel):

| Operasyon | Ücretsiz | Plus | Plus sınıra tam ulaşılırsa/ay |
|---|---|---|---|
| `ai-feedback` | **1/gün** (Plus'a yönlendirme mesajıyla biter) | 15/gün (25'ten düşürüldü) | 15 × 30 × $0.0024 ≈ **$1.08** |
| `tts` | Plus'a kilitli, $0 | 40/gün (80'den düşürüldü) | 40 × 30 × $0.0045 ≈ **$5.40** |
| `chat` | Plus'a kilitli, $0 | 25/gün (40'tan düşürüldü) | 25 × 30 × $0.0011 ≈ **$0.83** |
| **Toplam (Plus, üçü de her gün tam dolarsa)** | | | **≈ $7.31/ay/kullanıcı (~$88/yıl)** |

Önceki tura göre worst-case **%48 düştü** ($13.92 → $7.31/ay). Hâlâ yıllık
$65 (~$5.42/ay) fiyatın biraz üstünde ama artık çok daha yakın — ve bu
rakam yalnızca sınırlara HER GÜN tam ulaşan aykırı kullanıcılar için
geçerli, ortalama kullanıcı çok daha altında kalıyor (aşağıya bkz.).

**`ai-feedback` artık Plus'a kilitli** — ücretsiz kullanıcı günde 1 kez
deneyebilir (özelliğin gerçek olduğunu görsün), sonrasında net bir "Plus'a
geç" mesajıyla karşılaşır (skor yerine 🔒 ikonu + yönlendirme metni,
istemci tarafında ayrıca "Plus'a Geç" butonu paywall'a götürüyor). `tts` ve
`chat` zaten Plus'a kilitliydi, değişmedi.

Sınır sayıları (`FREE_DAILY_LIMIT`, `PLUS_DAILY_LIMIT`, `TTS_DAILY_LIMIT`,
`CHAT_DAILY_LIMIT`) her fonksiyonun kodunda açıkça sabit olarak duruyor —
daha da sıkılaştırmak istersen tek satır değiştirip yeniden deploy etmen
yeterli.

## 3. Gerçekçi kullanım senaryoları

### Ortalama aktif Plus kullanıcısı (günde ~20 dk pratik)
- ~20 TTS oynatma/gün, ~3 AI analiz/gün, ~5 sohbet turu/gün
- Aylık: (20×$0.0045 + 3×$0.0024 + 5×$0.0011) × 30 ≈ **$3.09/ay ≈ $37/yıl**
- Yıllık $65 gelire karşı ≈ **%57 COGS** — marj var ama rahat değil.

### Yoğun kullanıcı (günde ~60 dk, sınırların çoğuna yaklaşan)
- ~80 TTS (tam sınırda), ~15 AI analiz, ~20 sohbet turu
- Aylık: (80×$0.0045 + 15×$0.0024 + 20×$0.0011) × 30 ≈ **$12.54/ay ≈ $150/yıl**
- Bu, $65/yıl fiyatı **aşıyor.** Böyle kullanıcılar azınlıkta olacaktır
  ama varlığı, günlük sınırların (özellikle `tts`'in) bugünkü haliyle hâlâ
  gevşek olduğunu gösteriyor.

## 4. Öneri

Sınırlar şu an kasıtlı olarak "gerçek kullanımı kısıtlamayacak kadar
gevşek" seçildi (ürünü bozmamak için). İki seçenek:
1. **Böyle bırak, izle** — Supabase'de `ai_usage_daily` tablosunu
   sorgulayarak gerçek kullanıcıların günlük ortalamasının sınırlara ne
   kadar yakın olduğunu birkaç hafta sonra görebilirsin. Çoğu kullanıcı
   sınırın çok altında kalacaktır (yukarıdaki "ortalama" senaryo bunu
   gösteriyor) — asıl risk kuyruktaki birkaç aşırı kullanıcı.
2. **`tts` sınırını sıkılaştır** — en pahalı kalem bu (80×$0.0045=$0.36/gün,
   diğer ikisinin toplamından ~7 kat fazla). 40/gün'e indirmek worst-case'i
   ~$4.86 düşürür, gerçek kullanıcıların çoğunu etkilemez (ortalama senaryo
   zaten 20/gün kullanıyor).

## 5. Ücretsiz katman

3 Eylül'deki ikinci turdan sonra: `tts` ve `chat` Plus'a kilitli — ücretsiz
kullanıcı bu iki kalemden **$0** maliyet yaratıyor. `ai-feedback` de artık
Plus'a kilitli, tek istisna: günde **1 ücretsiz deneme** — bu, "freemium
teaser" mantığıyla bilinçli bırakıldı (özelliğin varlığını ve değerini
görsün, sonra Plus'a yönlensin). Ücretsiz bir kullanıcının bize toplam
maksimum aylık maliyeti artık **1 × 30 × $0.0024 ≈ $0.07/ay** — pratikte
sıfıra yakın.
