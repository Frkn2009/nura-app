# NURA — YAPILACAKLAR LİSTESİ (21 Ağustos 2026)

> Bu dosya tüm eksikleri ve yapılacak işleri öncelik sırasıyla içerir.
> Yeni sohbette bu dosyayı paylaşarak kaldığın yerden devam et.
> Her madde tamamlandığında ✅ işareti konur.

---

## 🔴 KRİTİK — HEMEN YAPILACAK

### 1. Logo — Sol üste NURA logosu
- [ ] Uygulama içinde sol üst köşede NURA logosu/yazısı
- [ ] AppBar'da her sayfada görünsün
- [ ] Profesyonel, temiz, telif sorunsuz özel tasarım
- [ ] Uygulama ikonu (app icon) da bu logo olsun

### 2. Konuş Butonu — Mikrofon aktif olsun
- [ ] Mikrofon izni düzgün isteniyor mu kontrol
- [ ] Web'de kısıtlı — telefonda tam çalışmalı
- [ ] Basılı tut → konuş → bırak → skor göster
- [ ] Ses her zaman kadın

### 3. Çeviri — Google Translate tarzı genel çeviri
- [ ] 30 dil arası çeviri (dropdown ile dil seçimi)
- [ ] Swap butonu (dil değiştir)
- [ ] Müfredat + sözlük tabanlı (uydurma çeviri yok)
- [ ] Plus ile genişletilmiş bulut çeviri (ileride)

### 4. Klipler — Dolu içerik
- [ ] Her dilde kısa video/ses klipleri gibi kartlar
- [ ] Swipe ile gezme
- [ ] Her klipin altında: yavaş / gölgele / konuş butonları
- [ ] Senaryolardaki cümlelerden otomatik klip üretimi

### 5. Tema — Profesyonel ve ciddi
- [ ] Renk paleti: modern, temiz, mağaza kalitesinde
- [ ] Tutarlı border-radius, spacing, tipografi
- [ ] Duolingo sevimli ama NURA daha ciddi-profesyonel
- [ ] Karanlık mod desteği (ileride)

---

## 🟡 ÖNEMLİ — BU HAFTA

### 6. Oyunlar — 4-5 FARKLI oyun (eski oyunlar değişecek)
- [ ] 🎯 **Doğru/Yanlış**: Cümle göster → doğru mu yanlış mı?
- [ ] 🔤 **Harf Sıralama**: Karışık harflerden kelime oluştur
- [ ] 🎧 **Ses Bulmaca**: Sesi dinle, 4 seçenekten doğrusunu bul
- [ ] 📝 **Boşluk Doldur**: Cümlede eksik kelimeyi yaz
- [ ] ⏱️ **Zamana Karşı**: 60 saniyede en çok doğru cevap
- Telif sorunu olmayacak — oyun mekaniği genel, özgün UI

### 7. XP / Puan Sistemi
- [ ] Her doğru cevap = +10 XP
- [ ] Her sahne tamamlama = +50 XP
- [ ] Her oyun = +20-100 XP (performansa göre)
- [ ] Günlük hedef: 100 XP
- [ ] Seviye sistemi: Çaylak → Öğrenci → Konuşan → Usta → Efsane
- [ ] XP ana sayfada ve profilde görünsün

### 8. Leaderboard / Sıralama
- [ ] Haftalık sıralama tablosu
- [ ] Clan/Takım sistemi (ileride)
- [ ] Supabase'de `leaderboard` tablosu
- [ ] Top 10 gösterimi
- [ ] Kendi sıranı gör

### 9. Başarım / Rozet Sistemi
- [ ] 🏅 İlk Adım — İlk sahneyi tamamla
- [ ] 🔥 Ateş Başladı — 3 gün üst üste seri
- [ ] 📚 10 Kalıp — 10 cümle öğren
- [ ] 🎮 Oyuncu — İlk oyunu tamamla
- [ ] 🌍 Gezgin — 3 farklı dilde sahne tamamla
- [ ] 💎 Plus — Plus üye ol
- [ ] 🏆 Hafta Birincisi — Leaderboard 1. ol
- [ ] ⭐ 100 XP — Günlük hedefe ulaş
- [ ] 🔥🔥 7 Gün Seri — 1 hafta kesintisiz
- [ ] 🎯 Mükemmel — Bir oyunda %100 doğru

### 10. Bildirimler — Öğretmen gibi
- [ ] "Hadi derse! 📚 Bugün henüz pratik yapmadın"
- [ ] "🔥 Serin 5 gün! Bugün kırma!"
- [ ] "🎮 Yeni oyun: Harf Sıralama dene!"
- [ ] Günde 1 bildirim (sabah 10:00 veya akşam 19:00)
- [ ] Plus kullanıcılara özel bildirimler
- [ ] Bildirim kapatma seçeneği profilde

### 11. Maskot / Karakter
- [ ] NURA'nın maskotu: sevimli bir karakter (baykuş/kedi/robot?)
- [ ] Onboarding'de karşılama
- [ ] Doğru cevaplarda kutlama animasyonu
- [ ] Yanlış cevaplarda teşvik
- [ ] Streak günlerinde özel animasyon
- [ ] Telif sorunu olmayacak — tamamen özgün tasarım

### 12. Süreli Etkinlikler + Video Reklam Gelir Kapısı
- [ ] Haftalık etkinlik: "Bu hafta İspanyolca XP 2 katı!"
- [ ] Etkinliğe katılmak için video reklam izle (15-30 sn)
- [ ] Free kullanıcı: her 3-5 dk'da video reklam
- [ ] Plus kullanıcı: video reklam YOK
- [ ] Video reklam izle = +30 saniye konuşma VEYA +20 XP
- [ ] Günde max 5 video reklam (aşırı rahatsız etme)
- [ ] Gelir modeli: eCPM × izlenme = gelir

---

## 🟢 SONRA — AY 2-3

### 13. İleri Özellikler
- [ ] A2 / B1 içerik ekleme
- [ ] Fonem skor motoru (gerçek telaffuz puanlama)
- [ ] Maya nöral TTS (AI ses)
- [ ] Bulut çeviri (Plus)
- [ ] Widget (günlük hatırlatma)
- [ ] Karanlık mod
- [ ] Çoklu profil (aile planı)

---

## 📋 DOSYA YAPISI (güncel)

```
lib/
├── main.dart
├── app.dart
├── core/
│   ├── l10n/i18n.dart           # 30 dil i18n
│   ├── router/app_router.dart   # Rotalar
│   ├── supabase_config.dart     # Bağlantı
│   └── theme/ (tokens + nura_theme)
├── data/
│   ├── content/catalog.dart     # 242 sahne
│   ├── content/language_guides  # 30 rehber
│   ├── models/models.dart       # 30 enum + UserProfile
│   ├── speech/speech_controller # 30 locale TTS/STT
│   ├── supabase/supa_service    # Auth + CRUD
│   └── translate/offline_translate
├── features/
│   ├── ads/          # Reklam kapısı
│   ├── auth/         # Giriş/kayıt
│   ├── clips/        # Klipler (düzenlenecek)
│   ├── games/        # 🆕 Oyunlar (yenilenecek)
│   ├── guide/        # Dil rehberi
│   ├── home/         # Ana sayfa
│   ├── legal/        # Gizlilik
│   ├── onboarding/   # İlk kurulum
│   ├── paywall/      # Ücretlendirme
│   ├── profile/      # Profil
│   ├── review/       # SRS tekrar
│   ├── shell/        # Bottom nav
│   ├── speak/        # Konuşma oturumu
│   └── translate/    # Çeviri
├── state/session.dart  # Riverpod state
└── ui/widgets.dart     # Ortak widgetlar
```

---

## 💡 YENİ SOHBETTE DEVAM

```
nura-app projesine devam et.
GitHub: https://github.com/Frkn2009/nura-app
docs/YAPILACAKLAR.md dosyasını oku.
İşaretlenmemiş maddeleri sırayla yap, her birini bitirdikçe işaretle.
Her değişikliği commit et ve GitHub'a push et.
Git token: (token'ını buraya yaz)
Supabase URL: https://qkhmtmwfwyscvtveiwui.supabase.co
Supabase Key: sb_publishable_maEu9eoz4fuC_I17Vamrlg_NTtsjqzo
```

---

## ⚠️ KURALLAR

1. **Telif yemeyelim** — tüm tasarımlar, oyun mekaniikleri, maskot özgün olacak
2. **Kadın ses** — TTS her zaman kadın
3. **30 dil** — hiçbir dil eksik kalmasın
4. **Profesyonel** — mağaza kalitesinde, ciddi yazılım
5. **Plus gelir** — video reklam Free'de, Plus'ta yok
6. **Logo sol üst** — her sayfada görünsün
