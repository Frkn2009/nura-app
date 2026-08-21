# NURA — DEVAM SAYFASI (21 Ağustos 2026 — Final)

## 📍 PROJE

| | |
|---|---|
| **GitHub** | https://github.com/Frkn2009/nura-app |
| **Son commit** | `68626b4` |
| **Supabase** | `https://qkhmtmwfwyscvtveiwui.supabase.co` |
| **Key** | `sb_publishable_maEu9eoz4fuC_I17Vamrlg_NTtsjqzo` |

## 📊 RAKAMLAR

| Metrik | Değer |
|---|---|
| Dil | **30** |
| Sahne | **242** (30×8 + ES bonus) |
| Kalıp cümle | **726** |
| Dil rehberi | **30** |
| Oyun | **3** (eşleştirme, hız, dinle) |
| Ekran | **16** |
| Dart dosya | **30+** |
| Toplam satır | **9.000+** |

## ✅ BİTEN HER ŞEY

### Temel
- 30 dil (enum + içerik + rehber + locale + çeviri)
- 242 A1 sahne (cafe, hotel, dir, hi, flat, shop, bill, airport)
- Onboarding → Ana sayfa → Konuş → Oyunlar → Çeviri → Profil
- Supabase auth + profil senkron + RLS + hesap silme

### Yeni (bugün eklenen)
- 🎮 **3 Oyun**: Kelime Eşleştirme, Hız Yarışı (30sn), Dinle & Seç
- 🌐 **Genel Çeviri**: 30 dil arası, Google Translate tarzı, dil seçici
- 🔊 **Kadın ses**: TTS her zaman kadın, pitch 1.1
- 🎨 **Yeni tema**: Mint #2EC4B6 + Coral #FF6B6B + Lavanta #9B72CF
- 📊 **XP sistemi**: streak×10 + phrases×5
- 📋 **Rakip analizi**: Duolingo/Babbel/Drops/Memrise karşılaştırma
- 🧪 **Test rehberi**: 6 yöntem (AI, Flutter, APK, emülatör)

### Düzeltilen hatalar
- UserProfileAds, phraseById, onAuthStateChange, label extension
- Android minSdk, publishableKey, catalog class kapanışı
- Svahili tırnak, speak_screens const, import eksikleri

## 🔶 KALAN İŞLER

| # | İş | Öncelik |
|---|---|---|
| 1 | `flutter analyze` + cihazda test | 🔴 |
| 2 | Mikrofon izni (web'de kısıtlı, telefonda çalışır) | 🔴 |
| 3 | RevenueCat (gerçek ödeme) | 🟡 |
| 4 | AdMob (gerçek reklam) | 🟡 |
| 5 | Leaderboard (haftalık) | 🟡 |
| 6 | Başarım rozetleri | 🟡 |
| 7 | Bildirimler | 🟢 |
| 8 | Maskot/karakter | 🟢 |

## 💡 DEVAM İÇİN

```
nura-app klasörünü takip et.
GitHub: https://github.com/Frkn2009/nura-app
docs/DEVAM_SAYFASI.md oku ve kaldığın yerden devam et.
```

## 🧪 AI'A VERİ ANALİZİ YAPTIRMAK İÇİN

Herhangi bir AI'a şunu ver:
```
GitHub: https://github.com/Frkn2009/nura-app

Bu Flutter dil öğrenme uygulamasını analiz et:
1. Kod kalitesi ve derleme hataları
2. UX/UI iyileştirme önerileri
3. Duolingo/Babbel ile karşılaştır, eksikler neler
4. Mağazaya hazır mı? Neler yapılmalı?
5. Büyüme stratejisi öner (organik + ücretli)
6. docs/RAKIP_ANALIZ_VE_PLAN.md dosyasını oku ve değerlendir
```
