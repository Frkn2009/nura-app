# v1.3 Harman Raporu — Danışman Dalgası (Gizlilik/Bildirim/State + GoRouter/Tema/Onboarding/Güvenlik)

**Tarih:** 2026-08-22
**Branch:** `arena/01a0275f-nura-app`
**Sürüm:** 0.2.2+4 (öncesi 0.2.1+3)
**Kapsam:** Gönderilen danışman notundaki tüm maddeler mevcut kodla karşılaştırıldı; gereksiz olanlar atlandı, eksikler mevcut mimariye uygun şekilde **yazıldı**.

---

## 1) Karşılaştırma tablosu

| # | Danışman önerisi | Repodaki durum | Karar / Yapılan |
|---|---|---|---|
| 7 | Legal ekranı (privacy + terms, i18n) | Sadece hardcoded Türkçe `PrivacyScreen` vardı | ✅ **Yazıldı**: `lib/features/legal/legal_screen.dart` — `LegalType {privacy, terms}` tek ekran, **7 dilde** (`tr/en/es/de/fr/nl/ar`) içerik. Eski dosya silindi, router `/privacy` + yeni `/terms` rotalarına bağlandı |
| 8 | Profilde hukuki linkler | Sadece "Gizlilik politikası" vardı | ✅ **Eklendi**: "Kullanım şartları" → `/terms` |
| 9 | `flutter_local_notifications` + günlük bildirim | Zaten `awesome_notifications` ile **daha gelişmiş** sistem var: 7 günlük kayan pencere, saat 10/19, seri/Plus/oyun içerikli mesajlar, izin yönetimi | ⏭️ **Atlandı** — yeni bağımlılık eklemek regresyon olurdu (mevcut sistem danışmanın önerdiğini zaten fazlasıyla karşılıyor) |
| 10 | Loading / Error / Offline state widget'ları | Hiçbiri yoktu | ✅ **Yazıldı**: `LoadingState`, `ErrorState`, `OfflineState` → `lib/ui/widgets.dart` (danışmanın `NuraButton` referansı repoda yoktu; mevcut temalı `FilledButton` kullanıldı) |
| 11 | GoRouter global router | Zaten vardı (`routerProvider`, Riverpod + session'a bağlı initialLocation) — danışmanın static-bool sınıfı **daha zayıf** | ⚠️ **Güçlendirildi**: `ShellRoute` → **`StatefulShellRoute.indexedStack`** (5 sekmede state artık korunuyor) + `errorBuilder` (404 → `ErrorState`) + `/terms` rotası |
| 12 | M3 tema, primary **#4F46E5** | M3 tema vardı ama primary mint `#147D76` | ✅ **İkisi de yapıldı** (kullanıcı tercihi): `NuraAccent` paletleri (mint / indigo), **Sen → Tema rengi** seçici; seçim profilde kalıcı, dark mode'da da uygulanıyor |
| 13 | Onboarding state kalıcılığı | Sadece `onboarded` bayrağı; adım kayboluyordu | ✅ **Yazıldı**: `UserProfile.onboardingStep` (JSON geriye dönük uyumlu), her ilerlemede kayıt, açılışta `initState`'te geri yükleme; bitirince sıfırlanır |
| 14 | Secure storage (token altyapısı) | Yoktu | ✅ **Yazıldı**: `flutter_secure_storage ^9.2.2` + `lib/core/storage/secure_storage.dart`. minSdk **23** olduğu için EncryptedSharedPreferences **tam destekli** (danışmanın "minSdk 21 için kapalı" uyarısı gerekmiyor — gradle 23) |

## 2) Ek güvenlik notları

- `UserProfile` yeni alanları (`themeAccent`, `onboardingStep`) **geriye dönük uyumlu**:
  eski kayıtlı profillerde `fromJson` varsayılan değer verir (`mint`, `0`), veri kaybı yok.
- `finishOnboarding()` onboardingStep'i 0'a çeker; aile profili kopyalamasında da yeni alanlar taşınır.
- Yedekler: `bash /home/user/backup.sh <etiket>` → `/home/user/backups/nura-<zaman>-<etiket>.zip` + SHA-256 kaydı; her tur sonunda git commit + push yapıldı.

## 3) Doğrulama komutları (yerel makinede)

```bash
flutter pub get        # flutter_secure_storage çekilir (pubspec yeni bağımlılık)
dart format lib test
flutter analyze
flutter test
```

Not: Bu sandbox'ta Flutter SDK yok (ağ kısıtlı), o yüzden derleme/test yerel ortamda çalıştırılmalı. Kod elle satır satır kontrol edildi; `const`/tip uyumu Flutter 3.27+ API'lerine göre yazıldı.

## 4) Test kriterleri (danışmanın listesinden uyarlanmış)

1. **Tema**: Sen → Tema rengi → İndigo seç. Butonlar/kart vurguları #4F46E5'e döner; koyu modda da çalışır. Yeşil'e dönünce eski görünüm.
2. **Router**: Sekmeler arası geçişte kaydırma pozisyonu/form korunur (indexedStack). Bilinmeyen URL'de "Sayfa bulunamadı" ekranı.
3. **Onboarding**: 2. adımda uygulamayı kapat → tekrar aç → kaldığın adımdan devam eder. Bitirince `/app`'e gider.
4. **Legal**: Profil → Gizlilik politikası / Kullanım şartları — içerik seçili arayüz dilinde.
5. **Secure storage**: `SecureStorage.instance.saveTokens(...)` → yeniden başlat → `getAccessToken()` okunur; `clearAll()` temizler.

## 5) Danışmanlara iletilecek özet

"Dalga 2 (gizlilik/bildirim/state + router/tema/onboarding/güvenlik) uygulandı.
Karşılaştırma sonucu: bildirim maddesi mevcut awesome_notifications altyapısıyla zaten
karşılanıyordu (yeni bağımlılık eklenmedi); GoRouter ve M3 tema mevcuttu ve
güçlendirildi (StatefulShellRoute, errorBuilder, aksan seçimi #4F46E5);
yeni yazılanlar: LegalScreen (7 dil), Loading/Error/Offline state widget'ları,
onboarding adım kalıcılığı, secure storage. minSdk 23 → EncryptedSharedPreferences açık."
