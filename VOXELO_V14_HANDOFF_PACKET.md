# 🚀 VOXELO V1.4 GLOBAL HANDOFF PACKET
**Tarih:** 22 Ağustos 2026
**Branch:** main
**Mimari:** Riverpod, GoRouter, Supabase, FSRS-inspired SRS, Hive-ready

## Entegre Edilen Silahlar

| Dosya | Açıklama |
|---|---|
| `lib/core/algorithm/fsrs5_engine.dart` | FSRS-5 tam parametreli beyin |
| `lib/core/algorithm/cognitive_tracker.dart` | Bilişsel takip (Reflex/Recall/Guess) |
| `lib/core/utils/clock.dart` | Clock provider + FakeClock (test için) |
| `lib/data/srs/srs_state.dart` | SrsCard immutable model |
| `lib/data/srs/srs_machine.dart` | FSRS-inspired SRS motoru |
| `lib/ui/review/swipe_review_card.dart` | Tinder tarzı kaydırma review |
| `lib/features/plus/domain/entitlement.dart` | Billing domain modeli |
| `lib/features/plus/data/billing_service.dart` | Billing abstract interface |
| `lib/features/plus/data/fake_billing_service.dart` | Test için fake billing |
| `lib/features/plus/state/plus_controller.dart` | Riverpod billing state |
| `test/srs_machine_test.dart` | SRS 6 test |
| `test/plus_controller_test.dart` | Billing 3 test |
| `VOXELO_CODING_CONTRACT.md` | 10 kural — kod sözleşmesi |
| `docs/STORE_CHECKLIST.md` | Mağaza hazırlık listesi |
| `scripts/build_release.sh` | Release build scripti |

## Mevcut Özellikler (v1.4)
- 30 dil, 242 sahne, 726 kalıp
- 30 dil rehberi
- FSRS-5 + FSRS-inspired SRS motorları
- Bilişsel takip (cevap süresi ölçümü)
- Kaydırmalı review
- Billing soyutlaması (RevenueCat-ready)
- Clock provider (testable)
- Supabase auth + profil senkron
- Kadın ses (TTS)
- Yeni tema (Mint/Coral/Lavanta)
- 3 oyun modu
- Google Translate tarzı çeviri

## Sonraki Adımlar (v1.5)
- Memory Map (görsel ilerleme haritası)
- Premium Dashboard (StreakCard + DailyGoalCard)
- Günlük 3 görev motoru
- Gerçek RevenueCat entegrasyonu
- Maskot / karakter
- Leaderboard (Supabase)
- Başarım rozetleri
- Push bildirimler
