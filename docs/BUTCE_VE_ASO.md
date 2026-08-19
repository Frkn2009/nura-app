# NURA — Gerçekçi bütçe ve mağaza planı (Ağustos 2026)

İç para birimi **USD**. TL fiyatı vitrindir.

Dürüst cümle: **“Hep en üstte, çok indirilme”** Duolingo / Cambly bütçesi ister. Bizim gerçekçi hedef: **Türkiye + İspanya nişinde** (`İngilizce konuşma`, `İspanyolca öğren`, `NIE`) ilk sayfa ve sürdürülebilir organik.

---

## 1) Algoritma (ne puanlar, ne puanlamaz)

### App Store (iOS)

Doğrudan sıralama:
- **Başlık** (30 karakter) — en ağır kelime
- **Alt başlık** (30 karakter)
- **Gizli keyword alanı** (100 karakter) — kullanıcı görmez
- İndirme hızı (o kelimeye tıklayıp indirme)
- **D1 / D7 geri dönüş** (kalite)
- Puan / yorum (dolaylı + dönüşüm)

Sıralamayı **doğrudan** etkilemez, indirmeyi etkiler:
- Açıklama metni (iOS’ta arama indeksi **yok**)
- İkon, ekran görüntüsü, video → tıklama ve dönüşüm

2026 notu: özel vitrin sayfaları (Custom Product Pages) organik aramada da çıkabiliyor. Screenshot yazısı “sıralama sinyali” iddiası tartışmalı — **insan için yaz**, anahtar kelime yığma.

Hedef: vitrin ziyaretinden kurulum **≥ %25–30**. Altı %20 ise sıralama düşer.

### Google Play

İki kademe:
1. **İndeks** — başlık, kısa açıklama (80), uzun açıklama (4000) taranır
2. **Sıra** — kurulum hızı, **7 gün içinde silme**, D7 tutma, puan hızı, Android Vitals (çökme)

Play’de açıklama **indekslenir** (iOS’tan fark). Web’den Play linkine backlink de zayıf sinyal.

Tek ülke patlaması o ülkeyi kaldırır. TR’de hız = TR sıralaması.

**Sahte indirme / satın alınmış yorum = ceza.** Google ve Apple 2026’da bunu daha iyi yakalıyor. Yapmıyoruz.

Ücretli reklam organik sırayı “satın almaz”; ama **kaliteli** indirme hızı organik sırayı iter. Reklamlı kullanıcı 1 günde silerse **zarar**.

---

## 2) NURA kelime stratejisi (TR önce)

Kazanılamaz (şimdilik): `duolingo`, `ingilizce öğren` (devler).

Kazanılabilir (ilk 90 gün):

| Öncelik | Sorgu | Neden |
|---|---|---|
| 1 | ingilizce konuşma | Niyet = ağız, rakip zayıf |
| 2 | ispanyolca öğren / ispanyolca konuşma | TR→ES göç |
| 3 | NIE ispanya / ispanya kira | Hiç uygulama yok denecek kadar boş |
| 4 | almanca konuşma | klasik TR talep |
| 5 | AI ingilizce öğretmen | 2025–26 yükselen |

iOS başlık (30): `NURA: İngilizce Konuş`  
iOS alt başlık: `İspanyolca Almanca AI`  
iOS keywords: `konuşma,ispanyolca,almanca,fransızca,flemenkce,NIE,telaffuz,ogretmen,pratik,seyahat`

Play başlık (30): `NURA: İngilizce Konuşma`  
Play kısa (80): `Günde 1 dk konuş. İspanyolca, Almanca, Fransızca, Flemenkçe. NIE ve kira sahneleri.`

Ekran 1–3 metni (arama önizlemesi):
1. “Günde 1 dakika konuş”
2. “İspanya: NIE, kira, empadronamiento”
3. “Duy → Gölgele → Konuş”

---

## 3) Bütçe — üç hız

Rakamlar **kurucu tek kişi, TR ağırlıklı, 2026**. Ajans yok.

### A) Hayatta kal (tavsiye edilen ilk 4 ay)

| Kalem | Ne zaman | USD |
|---|---|---|
| Apple Developer | Ay 0 | 99 / yıl |
| Google Play | Ay 0 | 25 (tek sefer) |
| Domain + e-posta | Ay 0 | 20 / yıl |
| Gizlilik sayfası | Ay 0 | 0 (kendi sitemiz) |
| Ekran görüntüsü | Ay 1 | 0 (biz üretiriz) |
| 20 klip (telefon çekimi) | Ay 1–2 | 0–150 |
| AI API (Plus azken) | Ay 1–3 | 20–50 / ay |
| Reklam | — | **0** |
| **Toplam 4 ay** | | **~200–400** |

Büyüme: Reels / TikTok / Shorts (Türkçe hata, İspanya vlog). Organik ASO.

### B) Ciddi ama zayıf (ay 4–9)

| Kalem | USD |
|---|---|
| A’daki sabitler | ~300 |
| Play / iOS yumuşak lansman reklamı (2 hafta, sadece TR) | 400–800 |
| Apple Search Ads (tam eşleşme: “ingilizce konuşma”) | 200–400 |
| Bir freelancer 1 gün ekran seti | 150–300 |
| AI API (büyüyen Plus) | 50–150 / ay |
| **Bu dönem toplam** | **~1.200–2.500** |

Beklenen CPI (eğitim, TR, 2026 kaba): Android **0,20–0,80 $**, iOS **1–3 $**.  
ABD’ye çıkma — CPI 4–7 $ olur, LTV yetmez.

### C) “Hep üstte” hayali (yapma)

Aylık 5–15 bin $ UAC + kreatif test. Duolingo hâlâ yer. **Yapmıyoruz.**

---

## 4) Zaman çizelgesi (para + sıra)

| Dönem | İş | Para (USD) | Mağaza hedefi |
|---|---|---|---|
| Hafta 1–2 | Ürün, hesaplar, gizlilik | 125 | — |
| Hafta 3–4 | TestFlight + Play internal, 20 kişi | 0 | çökme < %1 |
| Ay 2 | TR yumuşak çıkış, ASO v1, 12 Reels | 0–150 | 4.5+ puan, D1 ≥ %35 |
| Ay 3 | Kelime A/B, İspanya CPP, 1 ASA test | 200–400 | “ingilizce konuşma” ilk 20 TR |
| Ay 4–6 | Reklamla hız **yalnızca** tutan kullanıcıdaysa | 400–800 | D7 ≥ %15, silme düşük |
| Ay 6–12 | İkinci dil vitrini (DE), aile planı | API + 0–500 reklam | niş ilk 5 |

Kuzey yıldızı mağaza: **indirilme sayısı değil, 7. gün geri gelen**. Play, çok indirip silinen uygulamayı **aşağı iter**.

---

## 5) İndirilmeyi yükselten (yasal) taktikler

1. İlk 10 dakikada konuştur (zaten öyle).
2. Puan isteği **yalnızca** ritüel bitince, 4. günden sonra.
3. 1 yıldız yorumuna 24 saatte insan cevap.
4. Haftalık küçük güncelleme (Play “bakımlı uygulama”).
5. Çökme yok — Vitals kırmızıysa keşif kesilir.
6. TR + ES (İspanya) ayrı vitrin / custom page.
7. Reels → mağaza derin link. Sosyal = kurulum hızı.
8. Asla sahte yorum, asla teşvikli 5 yıldız.

---

## 6) 12 aylık nakit özeti (senaryo A, organik)

| | USD |
|---|---|
| Mağaza + domain | ~145 |
| API | ~300–600 |
| Reklam | 0 |
| **Yıl 1 nakit çıkış** | **~450–750** |
| Hedef gelir (yavaş) | 50–200 Plus × ~30 $ net / yıl = 1.500–6.000 (iyimser, ay 6+) |

İlk 5 ay eksi olabilir. Bu normal. Reklama **D7 tutma görülmeden** girme.

Kaynaklar: ASO 2026 (başlık/alt başlık/keyword; Play açıklama + hız + tutma + Vitals); CPI bantları küresel ortalamadır, TR eğitim alt banttadır.
