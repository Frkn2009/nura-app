# NURA — DEVAM SAYFASI (21 Ağustos 2026)

> Bu belge projenin tam durumunu, yapılanları ve kalan işleri içerir.
> Yeni bir oturumda bu dosyayı paylaşarak kaldığın yerden devam edebilirsin.

---

## 📍 PROJE BİLGİLERİ

| Bilgi | Değer |
|---|---|
| **GitHub** | https://github.com/Frkn2009/nura-app |
| **Branch** | `main` |
| **Son commit** | `05faaef` — feat: 30 dil, 152 sahne, supabase bağlı |
| **Framework** | Flutter (Dart) — `sdk: ^3.9.0` |
| **Backend** | Supabase (PostgreSQL + Auth + RLS) |
| **Supabase URL** | `https://qkhmtmwfwyscvtveiwui.supabase.co` |
| **Supabase Key** | `sb_publishable_maEu9eoz4fuC_I17Vamrlg_NTtsjqzo` |
| **Supabase SQL** | ✅ Çalıştırıldı — `profiles` tablosu aktif |
| **Paket yöneticisi** | `pubspec.yaml` — flutter_riverpod, go_router, supabase_flutter, speech_to_text, flutter_tts |
| **Version** | `0.2.1+3` |

---

## ✅ BİTEN İŞLER (21 Ağustos 2026)

### 30 Dil Desteği
🇬🇧 EN · 🇪🇸 ES · 🇩🇪 DE · 🇫🇷 FR · 🇳🇱 NL · 🇸🇦 AR · 🇵🇹 PT · 🇮🇹 IT · 🇷🇺 RU · 🇨🇳 ZH
🇯🇵 JA · 🇰🇷 KO · 🇹🇷 TR · 🇵🇱 PL · 🇸🇪 SV · 🇩🇰 DA · 🇳🇴 NO · 🇫🇮 FI · 🇬🇷 EL · 🇨🇿 CS
🇷🇴 RO · 🇭🇺 HU · 🇮🇳 HI · 🇹🇭 TH · 🇻🇳 VI · 🇮🇩 ID · 🇺🇦 UK · 🇮🇱 HE · 🇮🇷 FA · 🇰🇪 SW

### İçerik
- ✅ **152 sahne** (30 dil × 5 temel + İspanyolca NIE + contrato)
- ✅ **458 kalıp cümle** (her sahnede 3 cümle)
- ✅ **304 konuşma turu** (her sahnede 2 tur)
- ✅ **30 telaffuz rehberi** (kurallar + tuzaklar + ilk hafta)
- ✅ **30 TTS/STT locale** (speech_controller.dart)
- ✅ **Çeviri sözlüğü** 30 dilde temel kelimeler

### Ekranlar / Özellikler
- ✅ **Onboarding** — 5 adım: ana dil → öğrenme dili → rehber → neden → seviye
- ✅ **Ana Sayfa** — günün senaryosu, seri, ilerleme, konuşma süresi
- ✅ **Konuş Hub** — senaryo listesi, süre kontrolü
- ✅ **Konuşma Oturumu** — Duy → Gölgele → Konuş → Düzelt ritüeli
- ✅ **Klipler** — swipe ile gezme, yavaş/gölgele/konuş butonları
- ✅ **Çeviri** — müfredat + sözlük (uydurma çeviri yok)
- ✅ **Profil** — dil değiştir, Plus toggle, hesap sil
- ✅ **Auth** — e-posta + şifre giriş/kayıt, bulut senkron
- ✅ **Paywall** — 3 plan (aylık 249₺ / yıllık 1.490₺ / aile 2.290₺)
- ✅ **Reklam Kapısı** — mock 5sn reklam → +60sn
- ✅ **SRS Tekrar** — yine / iyi / kolay (aralıklı tekrar)
- ✅ **Gizlilik** — ekran + web sayfası
- ✅ **Saate göre selamlama** — günaydın / iyi günler / iyi akşamlar

### Backend / Supabase
- ✅ `profiles` tablosu — 17 kolon, user_id PK
- ✅ RLS (Row Level Security) — herkes sadece kendi verisini görür
- ✅ `delete_my_account()` — hesap tamamen silinir
- ✅ `pushProfile()` / `pullProfile()` — yerel ↔ bulut senkron
- ✅ Auth stream listener — oturum değişikliği takibi
- ✅ `publishableKey` formatı (Supabase 2026)

### Düzeltilen Hatalar
- ✅ `UserProfileAds.left(p)` → doğru formül
- ✅ `Catalog.phraseById()` → metot eklendi
- ✅ `onAuthStateChange` → Stream.listen() düzeltmesi
- ✅ `LearnLang.ar` label → null-safe
- ✅ Android `minSdk 16` → `21`
- ✅ `anonKey:` → `publishableKey:` (2026 format)

### Dosyalar ve Belgeler
- ✅ `site/index.html` — landing page
- ✅ `site/privacy.html` + `store/privacy.html` — gizlilik
- ✅ `store/play_tr.md` — Google Play mağaza metni + ASO
- ✅ `store/ios_tr.md` — App Store mağaza metni + keywords
- ✅ `store/SOCIAL.md` — 14 gün Reels/TikTok/YouTube planı
- ✅ `docs/ECONOMICS.md` — birim ekonomi (USD kilitli)
- ✅ `docs/BUTCE_VE_ASO.md` — bütçe + ASO stratejisi

---

## 🔶 KALAN İŞLER (öncelik sırasıyla)

### 🔴 Kritik (yayın öncesi)

| # | İş | Tahmini Süre | Not |
|---|---|---|---|
| 1 | `flutter pub get && flutter analyze` | 10 dk | Derleme hatası var mı kontrol |
| 2 | iOS/Android gerçek cihazda test | 30 dk | Emülatör + fiziksel cihaz |
| 3 | Uygulama ikonu güncelle | 30 dk | `store/icon.png` mevcut, `.appiconset`'e yerleştir |
| 4 | Splash screen | 30 dk | `flutter_native_splash` paketi |
| 5 | App Store / Play Store ekran görüntüleri | 2 saat | 3-5 screenshot + feature graphic |

### 🟡 Önemli (yayından sonra ilk hafta)

| # | İş | Tahmini Süre | Not |
|---|---|---|---|
| 6 | RevenueCat entegrasyonu | 2-3 saat | Gerçek ödeme. Şu an `setPlus(true)` toggle |
| 7 | AdMob entegrasyonu | 1-2 saat | Gerçek reklam. Şu an mock 5sn sayaç |
| 8 | Puan isteme (in-app review) | 30 dk | 4. günden sonra, ritüel bitince |
| 9 | Firebase Analytics / Crashlytics | 1 saat | Çökme takibi + kullanım metrikleri |
| 10 | Deep link (store → uygulama) | 1 saat | Sosyal medya → uygulama |

### 🟢 Sonra (ay 2-3)

| # | İş | Not |
|---|---|---|
| 11 | Her dile 3 sahne daha ekle (8 sahne/dil) | İçerik genişletme |
| 12 | Fonem skor motoru | Gerçek telaffuz puanlama |
| 13 | Maya nöral TTS | AI ses |
| 14 | Bulut çeviri (Plus) | ML Kit veya Cloud Translation |
| 15 | A2/B1 içerik | CEFR ilerleme |
| 16 | Widget (günlük hatırlatma) | Android/iOS widget |
| 17 | Bildirimler | Push notification |

---

## 📁 DOSYA YAPISI

```
nura-app/
├── android/                          # Android platform
├── ios/                              # iOS platform
├── web/                              # Web build
├── assets/
│   ├── content/                      # İçerik dosyaları
│   └── fonts/                        # Inter font ailesi
├── docs/
│   ├── BUTCE_VE_ASO.md              # Bütçe + mağaza stratejisi
│   ├── ECONOMICS.md                  # Birim ekonomi
│   ├── DEVAM_SAYFASI.md             # ← BU DOSYA
│   └── DURUM_RAPORU.md              # Teknik rapor
├── lib/
│   ├── main.dart                     # Giriş noktası (Supabase init)
│   ├── app.dart                      # MaterialApp.router
│   ├── core/
│   │   ├── l10n/i18n.dart           # 30 dil i18n
│   │   ├── router/app_router.dart   # GoRouter rotaları
│   │   ├── supabase_config.dart     # URL + publishableKey
│   │   └── theme/
│   │       ├── nura_theme.dart      # Material tema
│   │       └── tokens.dart          # Renk sabitleri
│   ├── data/
│   │   ├── content/
│   │   │   ├── catalog.dart         # 152 sahne (30 dil)
│   │   │   └── language_guides.dart # 30 dil rehberi
│   │   ├── models/models.dart       # 30 enum + UserProfile + Scenario
│   │   ├── speech/speech_controller.dart # TTS + STT (30 locale)
│   │   ├── supabase/supa_service.dart   # Auth + profil CRUD
│   │   └── translate/offline_translate.dart # Çeviri sözlüğü
│   ├── features/
│   │   ├── ads/ad_gate_screen.dart
│   │   ├── auth/auth_screen.dart
│   │   ├── clips/clips_screen.dart
│   │   ├── guide/language_guide_screen.dart
│   │   ├── home/home_screen.dart
│   │   ├── legal/privacy_screen.dart
│   │   ├── onboarding/onboarding_flow.dart
│   │   ├── paywall/paywall_screen.dart
│   │   ├── profile/profile_screen.dart
│   │   ├── review/review_screen.dart
│   │   ├── shell/app_shell.dart
│   │   ├── speak/speak_screens.dart
│   │   └── translate/translate_screen.dart
│   ├── state/session.dart           # Riverpod state (SharedPreferences + Supabase)
│   └── ui/widgets.dart              # NuraCard, Eyebrow, ChoiceTile, ForestButton
├── site/
│   ├── index.html                   # Landing page
│   └── privacy.html                 # Gizlilik web
├── store/
│   ├── SOCIAL.md                    # Sosyal medya planı
│   ├── icon.png                     # Uygulama ikonu
│   ├── ios_tr.md                    # App Store metni
│   ├── play_tr.md                   # Play Store metni
│   ├── privacy.html                 # Gizlilik (store linki)
│   ├── shot1.png                    # Ekran görüntüsü 1
│   └── shot2.png                    # Ekran görüntüsü 2
├── supabase_setup.sql               # Supabase tablo + RLS + fonksiyon
├── pubspec.yaml                     # Flutter bağımlılıklar
├── test/widget_test.dart            # 8 test
└── README.md                        # 30 dil özet
```

---

## 🔑 GİZLİ ANAHTARLAR

| Anahtar | Nerede | Değer |
|---|---|---|
| Supabase URL | `lib/core/supabase_config.dart` | `https://qkhmtmwfwyscvtveiwui.supabase.co` |
| Supabase publishableKey | `lib/core/supabase_config.dart` | `sb_publishable_maEu9eoz4fuC_I17Vamrlg_NTtsjqzo` |
| GitHub repo | `.git/config` | `https://github.com/Frkn2009/nura-app.git` |

> ⚠️ GitHub token'ı (`ghp_...`) hiçbir dosyada saklanmaz. Her push için yeniden girilir.

---

## 💡 YENİ OTURUMDA DEVAM İÇİN

Yeni sohbete şunu yapıştır:

```
nura-app klasörünü takip et.
GitHub: https://github.com/Frkn2009/nura-app
docs/DEVAM_SAYFASI.md dosyasını oku ve kaldığın yerden devam et.
```

---

## 📊 ÖZET RAKAMLAR

| Metrik | Değer |
|---|---|
| Dil sayısı | **30** |
| Toplam sahne | **152** |
| Kalıp cümle | **458** |
| Konuşma turu | **304** |
| Dil rehberi | **30** |
| Ekran sayısı | **13** |
| Dart dosya | **~25** |
| Git commit | **5** |
| Toplam satır (lib/) | **~6.500+** |
