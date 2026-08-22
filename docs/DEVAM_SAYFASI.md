# NURA — DEVAM SAYFASI (22 Ağustos 2026 — GÜNCEL)

## 📍 PROJE

| | |
|---|---|
| **GitHub** | https://github.com/Frkn2009/nura-app |
| **Son commit** | `c36de49` — AI modülleri eklendi |
| **Test** | ✅ 35/35 geçiyor |
| **Analyze** | ✅ Temiz |
| **Supabase** | `https://qkhmtmwfwyscvtveiwui.supabase.co` |
| **Supabase Key** | `sb_publishable_maEu9eoz4fuC_I17Vamrlg_NTtsjqzo` |
| **Windows test** | `C:\nura-app` + `PUB_CACHE=C:\pub-cache` |

## 📊 PROJE RAKAMLARI

| Metrik | Değer |
|---|---|
| Dil | **30** |
| Sahne | **242** |
| Kalıp cümle | **726** |
| Dil rehberi | **30** |
| Dart dosya | **63+** |
| Toplam satır | **14.000+** |
| Test | **35 geçiyor** |
| Oyun | **3** |
| AI modül | **5** (feedback, senaryo, özet, service, controller) |

## ✅ BİTEN MODÜLLER

### Temel
- 30 dil, 242 sahne, 726 kalıp
- Onboarding → Ana sayfa → Konuş → Oyunlar → Çeviri → Profil
- Supabase auth + profil senkron + RLS
- Kadın ses (TTS)
- Yeni tema (Mint/Coral/Lavanta)
- FSRS-5 + FSRS-inspired SRS motorları
- Bilişsel takip (Reflex/Recall/Guess)
- Kaydırmalı review (SwipeReviewCard)
- Billing soyutlaması (Plus/Free)
- Clock provider (testable)
- 3 oyun (eşleştirme, hız, dinle)
- Google Translate tarzı çeviri (30 dil arası)

### AI Modülleri (YENİ)
- ✅ `AiService` abstract interface
- ✅ `FakeAiService` — offline AI (API olmadan çalışır)
- ✅ `SupabaseAiService` — gerçek LLM (Supabase Edge Function `ai`)
- ✅ `supabase/functions/ai` — feedback / scenario / summary uçları
- ✅ Otomatik düşüş: ağ/anahtar hatasında offline AI'a geçer, asla boş ekran
- ✅ `AiFeedbackScreen` — skor + ipuçları + teşvik
- ✅ `AiScenario` — seviyeye göre senaryo üretimi
- ✅ `LessonSummary` — günlük hafıza raporu
- ✅ `aiServiceProvider` + `dailySummaryProvider` + `aiOfflineProvider` (Riverpod)

### Dokümantasyon
- NURA_CODING_CONTRACT.md (10 kural)
- NURA_V14_HANDOFF_PACKET.md (devir manifesti)
- YAPILACAKLAR.md (iş listesi)
- RAKIP_ANALIZ_VE_PLAN.md
- STORE_CHECKLIST.md
- TEST_REHBERI.md
- FLUTTER_KURULUM_WINDOWS.md

## 🔶 KALAN İŞLER

| # | İş | Öncelik |
|---|---|---|
| 1 | Logo sol üst (her sayfada) | 🔴 |
| 2 | Klipler sekmesi dolu içerik | 🔴 |
| 3 | 5 farklı oyun (mevcut 3 yenilenecek) | 🟡 |
| 4 | Leaderboard / Clan | 🟡 |
| 5 | Başarım rozetleri | 🟡 |
| 6 | Bildirimler (öğretmen gibi) | 🟡 |
| 7 | Maskot / karakter | 🟡 |
| 8 | Süreli etkinlik + video reklam | 🟡 |
| 9 | ~~Gerçek AI API bağlantısı (Supabase Edge Function)~~ ✅ | 🟢 |
| 10 | RevenueCat gerçek ödeme | 🟢 |
| 11 | AdMob gerçek reklam | 🟢 |
| 12 | A2/B1 içerik | 🟢 |

## 💡 YENİ SOHBETTE DEVAM

```
nura-app projesine devam et.
GitHub: https://github.com/Frkn2009/nura-app
docs/DEVAM_SAYFASI.md dosyasını oku.
35/35 test geçiyor, flutter analyze temiz.
Kalan işleri sırayla yap, her birini commit et ve push et.
Windows'ta test: C:\nura-app klasöründe, PUB_CACHE=C:\pub-cache ayarla.
Git push için credential gerekecek — kullanıcıya sor.
```
