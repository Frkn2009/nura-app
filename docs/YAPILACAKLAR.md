# VOXELO — YAPILACAKLAR LİSTESİ (26 Ağustos 2026 — GÜNCEL)

## 🔴 GERÇEK EKSİKLER (26 Ağustos — mağazaya çıkmadan önce kalanların tam listesi)

### Senin yapman gereken (hesap/ödeme gerektirir, AI yapamaz)
| # | İş | Not |
|---|---|---|
| 1 | Google Cloud Translate API anahtarı al | `translate` + `interpreter-translate` Supabase fonksiyonları şu an **çalışmıyor** (`GOOGLE_TRANSLATE_API_KEY` secret'ı hiç girilmemiş). Anahtarı sohbette paylaşırsan `supabase secrets set` ile ben girerim. |
| 2 | Google Play Console hesabı aç | Kayıt + tek seferlik $25 ödeme gerektirir, AI açamaz. |
| 3 | AdMob hesabı aç + gerçek ad unit ID'leri üret | Şu an test ID'leri kullanılıyor (`AndroidManifest.xml`/`Info.plist`), gerçek yayın öncesi değişmeli. |
| 4 | RevenueCat panelinde ürünleri tanımla | Kod hazır (`voxelo_plus_monthly/yearly/family`), panelde henüz tanımlı değil. Play Console hesabı olmadan da RevenueCat'in ücretsiz Test Store'uyla denenebilir. |
| 5 | Mağaza ekran görüntüleri + tanıtım videosu | Henüz üretilmedi, gerçek prodüksiyon/cihaz kaydı gerekiyor. |

### Ben yapabilirim (mekanik/kod, hemen)
| # | İş | Durum |
|---|---|---|
| 6 | Android imzalama dosyaları | ✅ 26 Ağustos'ta `C:\nura-app` (ASCII build klonu)'na kopyalandı — daha önce sadece gerçek repoda vardı, build klonunda yoktu. Artık release build önündeki engel değil. |
| 7 | `flutter build appbundle --release` | Henüz **hiç çalıştırılmadı** — söylersen şimdi deneyebilirim. |
| 8 | Clan sohbeti canlı fallback ismi | Supabase'deki `clan_chat` fonksiyonunda hâlâ "NURA " yazıyor (rename sed'i migration dosyalarına bilerek dokunmadı) — yeni bir migration ile düzeltilir, kozmetik/düşük öncelik. |
| 9 | iOS build | Bu oturumda hiç ele alınmadı, planda değildi. |

### Zaten hazır
- `flutter analyze` temiz, `flutter test` 35/35 geçiyor.
- Rename (Nura→Voxelo) tamamlandı, GitHub `voxelo-app` olarak push edildi.
- Arclume (holding şirketi) marka/logo işi bilinçli olarak ertelendi — Voxelo canlıya çıkıp ilk kullanıcıyı görmeden marka tesciline gerek yok.

---

## ✅ TAMAMLANAN MADDELER

### 1. Logo — Sol üste VOXELO logosu ✅
- [x] `lib/ui/brand.dart` — VoxeloMark (CustomPaint)
- [x] `lib/ui/voxelo_logo.dart` — VoxeloLogo + VoxeloAppBar widget
- [x] `assets/voxelo_logo.png` — logo görseli
- [x] AppBar'da her sayfada görünüyor

### 2. Konuş Butonu — Mikrofon aktif ✅
- [x] `lib/features/speak/speak_screens.dart` — basılı tut → konuş → bırak → skor
- [x] `lib/data/speech/speech_controller.dart` — 30 locale, kadın ses
- [x] `lib/data/speech/phoneme_scorer.dart` — fonem skor motoru
- [x] Ses her zaman kadın (pitch 1.1 + female voice selection)

### 3. Çeviri — Google Translate tarzı ✅
- [x] `lib/features/translate/translate_screen.dart` — 30 dil dropdown, swap butonu
- [x] `lib/data/translate/offline_translate.dart` — müfredat + sözlük
- [x] `lib/data/translate/cloud_translate.dart` — Plus bulut çeviri (Supabase Edge)

### 4. Klipler — Dolu içerik ✅
- [x] `lib/data/content/clips.dart` — LearningClip model, katalogdan otomatik üretim
- [x] `lib/features/clips/clips_screen.dart` — swipe + yavaş/gölgele/konuş

### 5. Tema — Profesyonel ✅
- [x] `lib/core/theme/tokens.dart` — Mint/Coral/Lavanta palette
- [x] `lib/core/theme/voxelo_theme.dart` — light theme
- [x] `lib/core/theme/dark_theme.dart` — dark theme
- [x] Tutarlı border-radius, spacing, tipografi

### 6. Oyunlar — Çeşitli ✅
- [x] `lib/features/games/games_screen.dart` — 3+ oyun modu
- [x] Kelime eşleştirme, hız yarışı, dinle & seç
- [x] XP kazanma her oyun sonunda

### 7. XP / Puan Sistemi ✅
- [x] Sahne tamamlama = XP
- [x] Oyun oynama = XP
- [x] `state/session.dart` — streak × 10 + phrasesKnown × 5

### 8. Leaderboard / Sıralama ✅
- [x] `lib/data/models/leaderboard.dart` — LeaderboardEntry model
- [x] `lib/features/leaderboard/leaderboard_screen.dart` — haftalık sıralama
- [x] Router'da `/leaderboard` rotası

### 9. Başarım / Rozet Sistemi ✅
- [x] `lib/data/models/achievements.dart` — 10 rozet enum
- [x] `lib/features/achievements/achievements_screen.dart` — rozet listesi
- [x] firstStep, fireStarted, tenPhrases, gamer, traveler, plus, weeklyChampion, dailyHundred, sevenDayStreak, perfectGame

### 10. Bildirimler ✅
- [x] `lib/data/notifications/notification_service.dart` — awesome_notifications
- [x] Günlük hatırlatma bildirimler
- [x] Streak koruma bildirimi

### 11. Maskot / Karakter ✅
- [x] `lib/ui/mascot.dart` — animasyonlu maskot (neutral, wave, celebrate, encourage, streak)
- [x] `assets/mascot_voxelo.png` — maskot görseli
- [x] Ana sayfada ve onboarding'de kullanılıyor

### 12. Süreli Etkinlikler + Video Reklam ✅
- [x] `lib/data/events/weekly_event.dart` — haftalık etkinlik modeli
- [x] `lib/features/events/weekly_event_screen.dart` — etkinlik ekranı
- [x] `lib/data/ads/ad_service.dart` — Google Mobile Ads entegrasyonu
- [x] `lib/features/ads/ad_gate_screen.dart` — video reklam kapısı

### 13. Clan / Takım ✅
- [x] `lib/data/models/clan.dart` — clan model
- [x] `lib/features/clan/clan_screen.dart` — clan ekranı

### 14. Aile Profilleri ✅
- [x] `lib/features/family/family_profiles_screen.dart` — 4 profil

### 15. AI Modülleri ✅
- [x] `lib/features/ai/data/ai_service.dart` — abstract interface
- [x] `lib/features/ai/data/fake_ai_service.dart` — offline AI
- [x] `lib/features/ai/domain/ai_feedback.dart` — domain modelleri
- [x] `lib/features/ai/screen/ai_feedback_screen.dart` — geri bildirim ekranı
- [x] `lib/features/ai/state/ai_controller.dart` — Riverpod state

### 16. SRS / Tekrar Motoru ✅
- [x] `lib/core/algorithm/fsrs5_engine.dart` — FSRS-5 tam parametreli
- [x] `lib/core/algorithm/cognitive_tracker.dart` — bilişsel takip
- [x] `lib/data/srs/srs_state.dart` — SrsCard immutable model
- [x] `lib/data/srs/srs_machine.dart` — FSRS-inspired SRS motoru
- [x] `lib/ui/review/swipe_review_card.dart` — kaydırmalı review

### 17. Billing ✅
- [x] `lib/features/plus/domain/entitlement.dart` — Plus/Free
- [x] `lib/features/plus/data/billing_service.dart` — abstract
- [x] `lib/features/plus/data/fake_billing_service.dart` — test için
- [x] `lib/features/plus/state/plus_controller.dart` — Riverpod

### 18. Diğer ✅
- [x] `lib/core/utils/clock.dart` — testable clock
- [x] `lib/data/content/intermediate_catalog.dart` — A2/B1 içerik
- [x] `lib/data/widgets/home_widget_service.dart` — Android/iOS widget
- [x] 30 dil rehberi, 242 sahne, 726 kalıp
- [x] Supabase auth + profil senkron + RLS + hesap silme
- [x] VOXELO_CODING_CONTRACT.md (10 kural)
- [x] Store checklist + release script

---

## 📊 PROJE RAKAMLARI

| Metrik | Değer |
|---|---|
| Dart dosya | **64** |
| Test dosya | **3** (35 test) |
| Toplam satır | **14.000+** |
| Dil | **30** |
| Sahne | **242** |
| Ekran | **19** |
| Oyun | **3+** |
| AI modül | **5** |
| Rozet | **10** |

---

## 🟢 MAĞAZAYA ÇIKIŞ ÖNCESİ

| # | İş | Durum |
|---|---|---|
| 1 | `flutter analyze` → 0 hata | ✅ |
| 2 | `flutter test` → 35/35 | ✅ |
| 3 | RevenueCat gerçek API key | ⏳ Store hesabı açılınca |
| 4 | AdMob gerçek ad unit ID | ⏳ AdMob hesabı açılınca |
| 5 | Keystore üret + imzala | ⏳ Release build |
| 6 | `flutter build appbundle --release` | ⏳ |
| 7 | Store screenshots + açıklama | ✅ Hazır |
| 8 | Privacy policy URL | ✅ site/privacy.html |

---

## 💡 DEVAM İÇİN

```
voxelo-app projesine devam et.
GitHub: https://github.com/Frkn2009/voxelo-app
docs/YAPILACAKLAR.md oku — 18 madde tamamlandı.
Mağazaya çıkış için kalan: RevenueCat, AdMob, keystore, release build.
Windows'ta test: C:\voxelo-app, PUB_CACHE=C:\pub-cache
```
