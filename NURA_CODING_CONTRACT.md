# 🚨 NURA GERÇEK KOD SÖZLEŞMESİ (V1.4)
1. **State:** Sadece Riverpod. `setState` yalnızca StatefulWidget içinde kabul edilir. Static Clock YASAK.
2. **SRS:** SM-2 YASAK. Sadece `NuraBrain` / `SrsMachine` (FSRS-inspired). SrsCard'ta 'phrase' alanı YOK.
3. **i18n:** UI içinde hardcoded String YASAK. Her şey `i18n.dart` üzerinden.
4. **Tema:** Hardcode renk YASAK. Sadece `Nura` token sınıfı.
5. **Test:** `DateTime.now()` doğrudan YASAK. Testler `FakeClock` ve `SharedPreferences.setMockInitialValues({})` ile çalışır.
6. **Billing:** Client-side `isPlus` YASAK. Sadece `PlusController` / `BillingService` üzerinden.
7. **Review:** `SwipeReviewCard` ve `CognitiveTracker` kullanılacak.
8. **Klasör:** Yeni dosyalar `features/`, `core/`, `data/`, `ui/` dışına çıkılamaz.
9. **Ses:** TTS her zaman kadın ses.
10. **Telif:** Tüm tasarımlar, oyun mekanikleri, maskot özgün olacak. Kopya YASAK.
