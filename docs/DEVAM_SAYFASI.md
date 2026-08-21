# NURA — DEVAM SAYFASI (21 Ağustos 2026 — Güncel)

> Yeni oturumda bu dosyayı paylaşarak kaldığın yerden devam edebilirsin.

---

## 📍 PROJE BİLGİLERİ

| Bilgi | Değer |
|---|---|
| **GitHub** | https://github.com/Frkn2009/nura-app |
| **Son commit** | `14521d9` — 242 sahne, mağaza görselleri |
| **Framework** | Flutter (Dart) — `sdk: ^3.9.0` |
| **Supabase URL** | `https://qkhmtmwfwyscvtveiwui.supabase.co` |
| **Supabase Key** | `sb_publishable_maEu9eoz4fuC_I17Vamrlg_NTtsjqzo` |
| **Supabase SQL** | ✅ `profiles` tablosu aktif |
| **Version** | `0.2.1+3` |

---

## ✅ BİTEN İŞLER

### 30 Dil
🇬🇧 EN · 🇪🇸 ES · 🇩🇪 DE · 🇫🇷 FR · 🇳🇱 NL · 🇸🇦 AR · 🇵🇹 PT · 🇮🇹 IT · 🇷🇺 RU · 🇨🇳 ZH
🇯🇵 JA · 🇰🇷 KO · 🇹🇷 TR · 🇵🇱 PL · 🇸🇪 SV · 🇩🇰 DA · 🇳🇴 NO · 🇫🇮 FI · 🇬🇷 EL · 🇨🇿 CS
🇷🇴 RO · 🇭🇺 HU · 🇮🇳 HI · 🇹🇭 TH · 🇻🇳 VI · 🇮🇩 ID · 🇺🇦 UK · 🇮🇱 HE · 🇮🇷 FA · 🇰🇪 SW

### Rakamlar
| Metrik | Değer |
|---|---|
| Toplam sahne | **242** |
| Dil başına sahne | **8** (İspanyolca 10) |
| Kalıp cümle | **726** |
| Konuşma turu | **484** |
| Dil rehberi | **30** |
| TTS/STT locale | **30** |
| Mağaza screenshot | **5 + feature graphic** |
| Ekran sayısı | **13** |
| Git commit | **7** |

### Tamamlanan Modüller
- ✅ 30 dil enum (LearnLang + UiLang)
- ✅ 242 A1 sahne (cafe, hotel, dir, hi, flat, shop, bill, airport + ES NIE/contrato)
- ✅ 30 telaffuz rehberi (kurallar + tuzaklar + ilk hafta)
- ✅ 30 TTS/STT locale desteği
- ✅ 30 dil çeviri sözlüğü
- ✅ i18n (30 dil arayüz)
- ✅ Onboarding (5 adım)
- ✅ Ana Sayfa (senaryo, seri, ilerleme)
- ✅ Konuş Hub + Konuşma Oturumu (Duy→Gölgele→Konuş→Düzelt)
- ✅ Klipler (swipe)
- ✅ Çeviri (müfredat + sözlük, uydurma yok)
- ✅ Profil (dil değiştir, Plus, hesap sil)
- ✅ Auth (e-posta + şifre, bulut senkron)
- ✅ Paywall (3 plan)
- ✅ Reklam Kapısı (mock +60sn)
- ✅ SRS Tekrar (yine/iyi/kolay)
- ✅ Gizlilik sayfası
- ✅ Supabase bağlantısı (publishableKey 2026)
- ✅ Splash screen config
- ✅ Mağaza görselleri (5 screenshot + feature graphic)
- ✅ Store metinleri (Play TR + iOS TR + ASO)
- ✅ Sosyal medya planı
- ✅ Ekonomi + bütçe dokümanı
- ✅ Tüm hatalar düzeltildi

### Düzeltilen Hatalar
- ✅ UserProfileAds.left → düzeltildi
- ✅ Catalog.phraseById() → eklendi
- ✅ onAuthStateChange → Stream.listen()
- ✅ LearnLang.ar label → null-safe
- ✅ Android minSdk 16 → 21
- ✅ anonKey → publishableKey (2026)

---

## 🔶 KALAN İŞLER

### 🔴 Yayın Öncesi

| # | İş | Süre |
|---|---|---|
| 1 | `flutter pub get && flutter analyze && flutter test` | 10 dk |
| 2 | iOS/Android cihazda test | 30 dk |
| 3 | Uygulama ikonu `.appiconset`'e yerleştir | 15 dk |
| 4 | `flutter_native_splash` paketini ekle + `dart run flutter_native_splash:create` | 10 dk |

### 🟡 Yayından Sonra İlk Hafta

| # | İş | Süre |
|---|---|---|
| 5 | RevenueCat (gerçek ödeme) | 2-3 saat |
| 6 | AdMob (gerçek reklam) | 1-2 saat |
| 7 | Firebase Analytics + Crashlytics | 1 saat |
| 8 | In-app review (puan isteme) | 30 dk |
| 9 | Deep link (sosyal → uygulama) | 1 saat |

### 🟢 Sonra

| # | İş |
|---|---|
| 10 | A2/B1 içerik ekleme |
| 11 | Fonem skor motoru |
| 12 | Maya nöral TTS |
| 13 | Bulut çeviri (Plus) |
| 14 | Widget + bildirimler |

---

## 📁 DOSYA YAPISI

```
nura-app/
├── lib/
│   ├── main.dart                        # Giriş (Supabase init)
│   ├── app.dart                         # MaterialApp.router
│   ├── core/
│   │   ├── l10n/i18n.dart              # 30 dil i18n
│   │   ├── router/app_router.dart      # GoRouter
│   │   ├── supabase_config.dart        # URL + key
│   │   └── theme/ (nura_theme + tokens)
│   ├── data/
│   │   ├── content/catalog.dart        # 242 sahne
│   │   ├── content/language_guides.dart # 30 rehber
│   │   ├── models/models.dart          # 30 enum + UserProfile
│   │   ├── speech/speech_controller.dart # 30 locale TTS/STT
│   │   ├── supabase/supa_service.dart  # Auth + CRUD
│   │   └── translate/offline_translate.dart
│   ├── features/ (13 ekran)
│   ├── state/session.dart              # Riverpod state
│   └── ui/widgets.dart
├── store/ (screenshots, metinler, ikon)
├── docs/ (ekonomi, bütçe, devam sayfası)
├── site/ (landing + gizlilik)
├── supabase_setup.sql
└── flutter_native_splash.yaml
```

---

## 💡 YENİ OTURUMDA DEVAM

```
nura-app klasörünü takip et.
GitHub: https://github.com/Frkn2009/nura-app
docs/DEVAM_SAYFASI.md dosyasını oku ve kaldığın yerden devam et.
```
