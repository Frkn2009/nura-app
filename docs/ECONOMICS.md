# VOXELITH birim ekonomi — USD kilitli (Ağustos 2026)

İç muhasebe para birimi **USD**. Mağaza fiyatı yerelleşir (TRY, EUR…). TL/USD kuru yalnızca vitrin çevirisidir; kararlar dolara bakarak alınır.

## Ücretsiz katman
- Konuşma: **günde 60 saniye**
- Motor: cihazda STT + cihaz TTS + senaryo iskelesi → **COGS ≈ \$0.00**
- Reklam: banner + ödüllü (Plus’ta kapalı)
- Çeviri: müfredat + seyahat sözlüğü (ücretsiz). Bulut çeviri Plus.

Türkiye’de eğitim eCPM düşük (banner ~\$0.30, ödüllü ~\$2.50).  
1 dk bulut konuşma ~\$0.01–0.012. TR reklamı bunu **karşılamaz**.  
Bu yüzden ücretsiz konuşma **asla buluta gitmez**. Kendini finanse eder.

Sabit varsayım (değiştirme, izle):

| Kalem | USD |
|---|---|
| Banner eCPM TR | 0.30 |
| Ödüllü eCPM TR | 2.50 |
| Ödüllü eCPM US | 10.00 |
| Ücretsiz konuşma COGS | 0.00 / dk |
| Plus konuşma COGS (cihaz STT + cihaz TTS, premium ses yok) | 0.00 / dk |
| Plus konuşma COGS (ElevenLabs premium ses, `eleven_v3`) | ≈ 0.005 / oynatma (~50 karakter) — bkz. `MALIYET_ANALIZI_2026_09.md` |
| Plus AI geri bildirimi (Claude Sonnet 5, `ai-feedback`) | ≈ 0.003 / çağrı |
| Plus canlı sohbet turu (Claude Haiku 4.5, `chat`) | ≈ 0.0015 / tur |

Hedef: Plus net gelirinin en fazla **%20**’si AI.
2.600 TL/yıl ≈ \$65 (40 TRY/USD varsayım) → store %15 sonrası ≈ \$55.25 → AI bütçesi ≈ \$11.05/yıl.
Gerçek COGS (Eylül 2026 itibariyle canlı, aşağıya bkz.) bunun çok altında kalıyor — bkz.
`docs/MALIYET_ANALIZI_2026_09.md`.

## Plus fiyat (vitrin)
- Aylık 240 TL ≈ \$6.00
- Yıllık 2.600 TL ≈ \$65.00 (varsayılan)
- Aile 8.000 TL / 4 profil (değişmedi)

## Kendini geliştirme kuralı
Gelir geldikçe sırayla açılır:
1. Daha fazla orijinal klip
2. Maya için nöral TTS
3. Fonem skor motoru
4. İkinci içerik yazarı

Kodda bayrak: `isPlus`. RevenueCat 3. gün.
