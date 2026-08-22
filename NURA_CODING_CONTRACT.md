# 🚨 NURA GERÇEK KOD SÖZLEŞMESİ (V1.4)

Bu kurallar yapısal yasadır. Yeni kod bu maddelere uymazsa PR devralınmaz.

1. **State:** Sadece Riverpod. Kalıcı durum için `setState` ve static Clock YASAK.
2. **SRS:** SM-2 YASAK. Tüm tekrar planlaması `NuraBrain` (FSRS-5 inspired, 19 parametre — `lib/core/algorithm/fsrs5_engine.dart`) üzerinden `SrsMachine` ile yapılır. `SrsCard`'da `phrase` alanı YOK; kart, kalıbı `id` ile Catalog'a bağlar.
3. **i18n:** YENİ ekranlarda hardcoded String YASAK. Her şey `lib/core/l10n/i18n.dart` üzerinden (7 dil deseni: tr/en/es/de/fr/nl/ar; geri kalan 23 dil `en` fallback'inden beslenir). Legacy ekranlardaki TR literal'leri P2 borcu olarak `docs/DEVIR_DOSYASI.md`'de listelidir.
4. **Tema:** Hardcode renk YASAK. Sadece `Nura` token'ları + tema accent sistemi (Mint | Indigo, `NuraThemeStyle`).
5. **Test:** `DateTime.now()` YASAK. Yeni kod `clockProvider`'dan zaman alır; testler `FakeClock` + `SharedPreferences.setMockInitialValues({})` + `prefsProvider.overrideWithValue(...)` ile çalışır.
6. **Billing:** Client-side `isPlus`'ın kaynak olarak kullanımı YASAK. Entitlement'ın tek kaynağı `BillingService.currentEntitlement()` (üretim: RevenueCat → `RevenueCatBillingService`; geliştirme: `FakeBillingService`). Profildeki `isPlus` alanı yalnızca çevrimdışı kapı önbelleğidir ve yalnızca `PlusController` sonucuyla senkronize edilir.
7. **Review:** Klasik 4 buton YASAK. `SwipeReviewCard` (sola = again, sağa = good) + `CognitiveTracker` (cevap süresi → hafıza ağırlığı).
8. **Klasör:** Yeni dosyalar mevcut yapı dışında konumlanmaz: `lib/features/`, `lib/core/`, `lib/data/`, `lib/state/`, `lib/ui/`, `test/`, `docs/`, `scripts/`.
9. **Anahtar:** Hiçbir secret kaynak koda veya dokümana yazılmaz. RevenueCat `publicApiKey` (public, secret değil) placeholder'dır; mağaza yayınından önce ortam değişkeniyle enjekte edilir. Supabase publishable key mevcut haliyle kalır (public key).
