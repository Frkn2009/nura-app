# 🚨 NURA GERÇEK KOD SÖZLEŞMESİ (V1.4)

Bu sözleşme, repoya yazılan tüm kod için **bağlayıcıdır**. Yeni AI/geliştirici
bu kurallara aykırı kod yazamaz.

1. **State:** Sadece Riverpod. `setState` ile yönetilen global durum ve static
   değişken tabanlı state YASAK. Zaman için `clockProvider` / `FakeClock`.
2. **SRS:** SM-2 YASAK. Sadece `SrsMachine` (FSRS-esinli, `lib/data/srs/`) ve
   `NuraBrain` (FSRS-5, `lib/core/algorithm/fsrs5_engine.dart`). SrsCard'ta
   **`phrase` alanı YOKTUR** — kart içerikten bağımsızdır.
3. **i18n:** UI içinde hardcoded String YASAK. Her şey `lib/core/l10n/i18n.dart`
   üzerinden (`t()` sözlük sistemi).
4. **Tema:** Hardcode renk YASAK. Sadece `Nura` token'ları
   (`lib/core/theme/tokens.dart`) ve `NuraAccent` paletleri
   (`lib/core/theme/accents.dart`).
5. **Test:** Testlerde `DateTime.now()` YASAK. `FakeClock` ve
   `SharedPreferences.setMockInitialValues({})` kullanılır.
6. **Billing:** Client-side `isPlus` bayrağıyla yetki veren kod YASAK. Yetki
   yalnızca `BillingService.currentEntitlement()` üzerinden (`plusControllerProvider`).
7. **Review:** Klasik 4 butonlu akış yalnızca geçici olabilir; kalıcı akış
   `SwipeReviewCard` + `CognitiveTracker` ile kurulur.
8. **Klasör:** Yeni dosyalar `features/`, `core/`, `data/` dışına çıkamaz
   (kök dokümanlar ve `scripts/` hariç).
9. **Bağımlılık:** Yeni paket eklemek için önce `flutter pub get` ile
   `pubspec.lock` güncellenir; `flutter analyze` 0 hata garantisi olmadan
   commit edilmez.
