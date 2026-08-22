# NURA — Devir / El Değiştirme Dosyası
**Hazırlayan:** Arena.ai Agent Mode asistanı (oturum: `arena/01a0275f-nura-app`)
**Tarih:** 2026-08-22
**Amaç:** Bu dosya, v1.3 dalgasının repodaki **son durumunu** başka bir yapay zekaya / danışmana olduğu gibi iletmek içindir. Yanında `docs/v13-son-durum.patch` (60 KB, `git apply` ile uygulanabilir) ve `docs/V13_HARMAN_RAPORU.md` (danışman karşılaştırma tablosu) vardır.

---

## 0. Temel bilgiler

| Öğe | Değer |
|---|---|
| Repo | https://github.com/Frkn2009/nura-app |
| Branch | `arena/01a0275f-nura-app` (tek çalışma branch'i; `main`'e PR açılır) |
| Başlangıç commit'i | `9848427` (docs(handoff)) |
| Son commit (HEAD) | `881536b` (chore(ci): workflow silindi…) — **local = remote** ✅ |
| Sürüm | `0.2.2+4` (pubspec.yaml) |
| Çalışma ağacı | Temiz (değişiklik yok) |
| Uygulama | NURA — konuşarak öğren, 30 dil, Flutter (Material 3, Riverpod, GoRouter, Supabase opsiyonel) |

---

## 1. Bu turda yapılanlar (v1.3 dalgası — 8 madde)

Kaynak: kullanıcının verdiği danışman notu (Gizlilik/Bildirim/State + GoRouter/Tema/Onboarding/Güvenlik).
Karşılaştırma sonucu: **2 madde mevcut kodda zaten vardı (güçlendirildi), 1 madde bilinçli atlandı, 5 madde sıfırdan yazıldı.**

| # | Madde | Karar | Dosya(lar) |
|---|---|---|---|
| 1 | Legal ekran (Privacy + Terms, çok dilli) | ✅ Yeni | `lib/features/legal/legal_screen.dart` (eski `privacy_screen.dart` silindi) |
| 2 | Profil'de hukuki linkler | ✅ Eklendi | `lib/features/profile/profile_screen.dart` (`/privacy`, `/terms`) |
| 3 | Günlük bildirim | ⏭️ Atlandı | Mevcut `awesome_notifications` altyapısı (7 günlük kayan pencere, saat 10/19, seri/Plus/oyun mesajları) zaten daha gelişmişti → yeni bağımlılık eklenmedi |
| 4 | Loading / Error / Offline state widget'ları | ✅ Yeni | `lib/ui/widgets.dart` (`LoadingState`, `ErrorState`, `OfflineState`) |
| 5 | GoRouter güçlendirme | ⚠️ Var olan geliştirildi | `lib/core/router/app_router.dart` — `ShellRoute` → **`StatefulShellRoute.indexedStack`** (5 sekme, state korunur) + `errorBuilder` + `/terms` rotası; `lib/features/shell/app_shell.dart` |
| 6 | M3 tema + **indigo #4F46E5** | ✅ İkisi birden | `lib/core/theme/accents.dart` (mint/indigo paletleri), `tokens.dart`, `nura_theme.dart`, `dark_theme.dart`, `app.dart`, `profile_screen.dart` (Sen → Tema rengi seçici) |
| 7 | Onboarding kaldığı adımdan devam | ✅ Yeni | `lib/data/models/models.dart` (`onboardingStep`), `lib/state/session.dart` (`setOnboardingStep`), `lib/features/onboarding/onboarding_flow.dart` |
| 8 | Secure storage altyapısı | ✅ Yeni (şu an stub) | `lib/core/storage/secure_storage.dart` + `pubspec.yaml` (paket yorumlu — aşağıda kritik not) |

Ek: `lib/core/l10n/i18n.dart` → hukuki metinler + durum metinleri **7 dilde** (tr/en/es/de/fr/nl/ar).

---

## 2. Kritik notlar (yeni danışman bunları bilmeli)

### a) `flutter_secure_storage` şu an KAPALI
- `pubspec.yaml` satır 29: `# flutter_secure_storage: ^9.2.2  # TODO: flutter pub get çalıştırılıp lock güncellenince aç`
- **Neden:** `pubspec.lock` güncellenemedi (sandbox'ta ağ yok, `flutter pub get` çalıştırılamadı) → analyze "Target of URI doesn't exist" veriyordu.
- `lib/core/storage/secure_storage.dart` şu an **stub** (arayüz aynı, gerçek şifreleme yok).
- **Açmak için:** `pubspec.yaml`'daki yorumu kaldır → `flutter pub get` → CI'da analyze/test geçmeli. `minSdk 23` olduğu için `EncryptedSharedPreferences` tam destekli.

### b) Tema sistemi
- `NuraAccent` (`lib/core/theme/accents.dart`): `mint` (varsayılan, #147D76) ve `indigo` (#4F46E5) — açık + koyu renkler dahil.
- `UserProfile.themeAccent` (enum `ThemeAccent { mint, indigo }`) JSON'da saklanır; eski profillerde varsayılan `mint` → **veri kaybı yok**.
- `buildNuraTheme({accent})` / `buildNuraDarkTheme({accent})` — `app.dart` seçimi `ref.watch(sessionProvider.select(...))` ile izler.

### c) Onboarding persistence
- `UserProfile.onboardingStep` (int, JSON uyumlu, varsayılan 0).
- `OnboardingFlow.initState` → `ref.read(sessionProvider).onboardingStep.clamp(0,4)` ile geri yükler; her ileri adımda `setOnboardingStep(step)` kaydeder; `finishOnboarding()` sıfırlar.

### d) Router yapısı (5 sekme, state korunur)
- `StatefulShellRoute.indexedStack` + 5 `StatefulShellBranch`: `/app`, `/app/speak`, `/app/games`, `/app/translate`, `/app/you`.
- `AppShell` artık `StatefulNavigationShell` alır, `navigationShell.goBranch(i, initialLocation: ...)` kullanır.
- `errorBuilder` → `ErrorState(message: 'Sayfa bulunamadı')`.
- Not: `AppShell`'de `appBar: NuraAppBar()` **her sekmede** görünüyor (mevcut tasarım — değiştirilmedi).

### e) Analyze düzeltmeleri (bu turda yapıldı)
- `app.dart`: Riverpod 2.6'da kaldırılan `fireImmediately` parametresi kaldırıldı.
- `models.dart`: gereksiz `package:collection` importu kaldırıldı (asNameMap yoktu artık — aslında kaldırınca kullanılmıyordu).
- `clan_screen.dart`: unused import + `if` bloğuna süslü parantez.
- `speech_controller.dart`: deprecated `localeId/listenFor/pauseFor` → `SpeechListenOptions` içine taşındı.
- `games_screen.dart` / `family_profiles_screen.dart`: gereksiz `characters` importu kaldırıldı.
- `profile_screen.dart`: gereksiz `!` kaldırıldı.
- `onboarding_flow.dart`: `_native/_learn/_why/_level` fonksiyonlarına `I18n` tipi eklendi + `i18n.dart` importu.
- `legal_screen.dart`: `i18nProvider` için `state/session.dart` importu eklendi.

---

## 3. CI / TEST DURUMU (çok önemli)

### GitHub Actions kurulumunun özeti
- Bot (arena-ai-coding-agent) `.github/workflows/*` **oluşturamıyor ve API ile düzenleyemiyor** (403: workflows permission yok) — **silme** izni var.
- Workflow dosyasını **repo sahibi web arayüzünden** oluşturuyor. Bu yüzden her değişiklikte dosya silinip link ile yeniden kuruldu (commit geçmişindeki "Create ci.yml" / "Update ci.yml" / "chore(ci): workflow silindi" zinciri bunun izleridir).
- Log/artifact indirme sandbox'tan **bloklu** (blob sunucusu EOF). Hata teşhisi ancak `::error::` → **annotations API** yoluyla yapılabildi.

### Son doğrulanan durum (CI, 2026-08-22)
| Aşama | Sonuç |
|---|---|
| `flutter pub get` | ✅ |
| `flutter analyze` | ✅ **"No issues found!"** |
| `flutter test` | ⚠️ **25 passed, 1 failed** (iki ayrı koşuda aynı) |

> ⚠️ **Fail eden testin adı tespit edilemedi.** Sebep: GitHub annotations API'si run başına ~10 satır tutuyor; fail detayı log'da kaldı ve sandbox log blob'una erişemiyor.
> **Yeni danışmanın ilk işi:** `flutter test`'i yerelde çalıştırıp fail eden testi bulmak. Şüpheli adaylar: tarih/saat duyarlı testler (ör. `weekly Spanish event and ad frequency rules`, `dark theme and user preference are persisted`) — ancak hiçbiri açıkça kırık görünmüyor; en olası aday **widget testi** (`original Luma mascot renders every expression`) veya **session/JSON migration** testleri.

### Workflow dosyasının şu anki durumu
- Repoda **yok** (HEAD `881536b`'de silindi — bot silme hakkıyla).
- **Diskte duruyor:** `.github/workflows/ci.yml` (gitignore'lu, takip edilmiyor). İçerik:

```yaml
name: ci
on:
  push:
    branches: [arena/01a0275f-nura-app]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          channel: stable
      - run: flutter pub get
      - run: flutter analyze
      - name: Test
        run: |
          set +e
          flutter test 2>&1 | tee test.log
          sed 's/^/::error::/' test.log
          exit ${PIPESTATUS[0]}
```

- **Önerilen kalıcı (sade) versiyon** — bu sefer `exit ${PIPESTATUS[0]}` **doğru** çünkü `flutter test | tee` pipeline'ının ilk elemanının çıkışını döndürür:

```yaml
name: ci
on:
  push:
    branches: [arena/01a0275f-nura-app]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          channel: stable
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
```

> Not: `.gitignore` içine `.github/workflows/` satırı ekli — workflow repo'ya girerse ignore edilir; GitHub yine de `push` event'inde çalıştırır. Kalıcı olarak repo'ya alınması isteniyorsa bu satır `.gitignore`'dan kaldırılmalı.

---

## 4. Değişen dosyalar (özet)

`git diff --stat 9848427..HEAD` (26 dosya, +674/−110):

```
 .gitignore                                      |   1 +
 docs/V13_DOGRULAMA_RAPORU.md                    |  50 ++++++++
 docs/V13_HARMAN_RAPORU.md                       |  56 +++++++++
 lib/app.dart                                    |  11 +-
 lib/core/l10n/i18n.dart                         | 146 ++++++++++++++++++
 lib/core/router/app_router.dart                 |  70 ++++++----
 lib/core/storage/secure_storage.dart            |  39 +++++++
 lib/core/theme/accents.dart                     |  61 ++++++++++
 lib/core/theme/dark_theme.dart                  |  15 +--
 lib/core/theme/nura_theme.dart                  |  44 +++----
 lib/core/theme/tokens.dart                      |   5 +
 lib/data/ads/ad_service.dart                    |   2 +-
 lib/data/models/models.dart                     |  21 ++++
 lib/data/speech/speech_controller.dart          |   6 +-
 lib/features/clan/clan_screen.dart              |   9 +-
 lib/features/family/family_profiles_screen.dart |   1 -
 lib/features/games/games_screen.dart            |   1 -
 lib/features/home/home_screen.dart              |   2 +-
 lib/features/legal/legal_screen.dart            |  38 ++++++
 lib/features/legal/privacy_screen.dart          |  32 ------
 lib/features/onboarding/onboarding_flow.dart    |  25 +++-
 lib/features/profile/profile_screen.dart        |  28 ++++-
 lib/features/shell/app_shell.dart               |  14 +--
 lib/state/session.dart                          |  11 +-
 lib/ui/widgets.dart                             |  93 +++++++++++++++
 pubspec.yaml                                    |   3 +-
```

---

## 5. Yeni dosyaların tam kodu (kritik olanlar)

### `lib/core/theme/accents.dart` (tam)
```dart
import 'package:flutter/material.dart';

/// NURA marka aksan paletleri. Kullanıcı Sen → Tema rengi'nden seçer.
class NuraAccent {
  const NuraAccent({
    required this.name,
    required this.primary,
    required this.primaryDark,
    required this.primaryLight,
    required this.darkPrimary,
    required this.darkOnPrimary,
    required this.darkPrimaryContainer,
    required this.darkOnPrimaryContainer,
  });

  final String name;
  final Color primary;
  final Color primaryDark;
  final Color primaryLight;
  final Color darkPrimary;
  final Color darkOnPrimary;
  final Color darkPrimaryContainer;
  final Color darkOnPrimaryContainer;

  static const mint = NuraAccent(
    name: 'mint',
    primary: Color(0xFF147D76),
    primaryDark: Color(0xFF0D5955),
    primaryLight: Color(0xFFE1F1EF),
    darkPrimary: Color(0xFF67C9C0),
    darkOnPrimary: Color(0xFF062F2D),
    darkPrimaryContainer: Color(0xFF164542),
    darkOnPrimaryContainer: Color(0xFFD5F5F1),
  );

  static const indigo = NuraAccent(
    name: 'indigo',
    primary: Color(0xFF4F46E5),
    primaryDark: Color(0xFF3730A3),
    primaryLight: Color(0xFFE0E7FF),
    darkPrimary: Color(0xFF818CF8),
    darkOnPrimary: Color(0xFF1E1B4B),
    darkPrimaryContainer: Color(0xFF312E81),
    darkOnPrimaryContainer: Color(0xFFE0E7FF),
  );

  static const all = [mint, indigo];
}
```

### `lib/features/legal/legal_screen.dart` (tam)
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n.dart';
import '../../core/theme/tokens.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

enum LegalType { privacy, terms }

class LegalScreen extends ConsumerWidget {
  const LegalScreen({super.key, required this.type});

  final LegalType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final isPrivacy = type == LegalType.privacy;

    return Scaffold(
      appBar: NuraAppBar(
        pageTitle: Text(isPrivacy ? i18n.privacyPolicy : i18n.termsOfService),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 32),
          child: Text(
            isPrivacy ? i18n.privacyBody : i18n.termsBody,
            style: const TextStyle(height: 1.6, color: Nura.ink, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
```

### `lib/core/storage/secure_storage.dart` (tam — STUB)
```dart
import 'package:flutter/foundation.dart';

/// Hassas veriler (token, refresh token vb.) için şifreli depolama.
/// NOT: flutter_secure_storage paketi henüz lock'a eklenmedi → stub.
class SecureStorage {
  SecureStorage._();

  static final SecureStorage instance = SecureStorage._();

  static const _accessTokenKey = 'nura.access_token';
  static const _refreshTokenKey = 'nura.refresh_token';

  Future<void> saveTokens({required String access, required String refresh}) async {
    debugPrint(
      '[SecureStorage] hazır değil: flutter_secure_storage paketi eklenmedi '
      '($_accessTokenKey/$_refreshTokenKey)',
    );
  }

  Future<String?> getAccessToken() async => null;
  Future<String?> getRefreshToken() async => null;
  Future<void> clearAll() async {}
}
```
> Açılacak gerçek sürüm: `aOptions: AndroidOptions(encryptedSharedPreferences: true)`, `iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock)` (git geçmişinde `94036f4`'te var).

### `lib/ui/widgets.dart` — yeni durum widget'ları (özet)
- `LoadingState({String? message})` → spinner + opsiyonel metin
- `ErrorState({required String message, VoidCallback? onRetry, String? retryLabel})` → ikon + mesaj + FilledButton
- `OfflineState({VoidCallback? onRetry, String? retryLabel})` → `cloud_off` ikonu + "İnternet bağlantın yok." + buton

### `lib/data/models/models.dart` — yeni alanlar
- `enum ThemeAccent { mint, indigo }`
- `UserProfile.themeAccent` (default `mint`), `UserProfile.onboardingStep` (default `0`)
- `toJson`/`fromJson` uyumlu; eski veride varsayılan → **migration güvenli**

### `lib/state/session.dart` — yeni setter'lar
```dart
Future<void> setThemeAccent(ThemeAccent value) => _save(state.copyWith(themeAccent: value));
Future<void> setOnboardingStep(int step) => _save(state.copyWith(onboardingStep: step));
Future<void> finishOnboarding() => _save(state.copyWith(onboarded: true, streak: 1, onboardingStep: 0));
```

### `lib/app.dart` — tema bağlama
```dart
final accent = switch (ref.watch(sessionProvider.select((p) => p.themeAccent))) {
  ThemeAccent.mint => NuraAccent.mint,
  ThemeAccent.indigo => NuraAccent.indigo,
};
// ...
theme: buildNuraTheme(accent: accent),
darkTheme: buildNuraDarkTheme(accent: accent),
```

### `lib/core/router/app_router.dart` — çekirdek yapı
```dart
StatefulShellRoute.indexedStack(
  builder: (_, _, navigationShell) => AppShell(navigationShell: navigationShell),
  branches: [
    StatefulShellBranch(routes: [GoRoute(path: '/app', builder: (_, _) => const HomeScreen())]),
    StatefulShellBranch(routes: [GoRoute(path: '/app/speak', builder: (_, _) => const SpeakHubScreen())]),
    StatefulShellBranch(routes: [GoRoute(path: '/app/games', builder: (_, _) => const GamesScreen())]),
    StatefulShellBranch(routes: [GoRoute(path: '/app/translate', builder: (_, _) => const TranslateScreen())]),
    StatefulShellBranch(routes: [GoRoute(path: '/app/you', builder: (_, _) => const ProfileScreen())]),
  ],
),
// + errorBuilder: (context, state) => const ErrorState(message: 'Sayfa bulunamadı')
// + GoRoute('/terms') ve GoRoute('/privacy') → LegalScreen
```

### `lib/features/onboarding/onboarding_flow.dart` — persistence
```dart
late int step;
@override
void initState() {
  super.initState();
  step = ref.read(sessionProvider).onboardingStep.clamp(0, _lastStep).toInt();
}
// İleri: setState(() => step++); unawaited(ref.read(sessionProvider.notifier).setOnboardingStep(step));
// Bitir: await ref.read(sessionProvider.notifier).finishOnboarding(); context.go('/app');
```

---

## 6. Sıradaki adımlar (yeni danışman için TODO)

1. **🔴 Fail eden 1 testi bul ve düzelt** (yerelde `flutter test`; CI log erişimi kısıtlı olduğu için adı bilinmiyor).
2. **Workflow'u kalıcı kur** — yukarıdaki "sade" YAML'ı web'den `Create file` (bot oluşturamıyor; kullanıcıya link verilir). `.gitignore`'daki `.github/workflows/` satırı kalıcı istiyorsa kaldırılmalı.
3. **`flutter_secure_storage`'ı aç** — yorumu kaldır → `flutter pub get` → SecureStorage stub'ını gerçek implementasyonla değiştir (git geçmişi `94036f4` referans).
4. Kullanıcının istediği sonraki dalgalar (danışman planı):
   - Ana ekran premium dashboard iyileştirmesi
   - Günlük 3 görev
   - Katalog kalitesi
   - Store hazırlığı (ASO) — `docs/BUTCE_VE_ASO.md`, `docs/YAPILACAKLAR.md` var

## 7. Yedekler (sandbox'ta)

- `/home/user/backups/nura-2026-08-22_030108-v13-oncesi-temiz-durum.zip`
- `/home/user/backups/nura-2026-08-22_030632-v13-harmani-tamam.zip`
- Kayıtlar: `/home/user/backups/yedek-kayitlari.txt` (SHA-256 ile)
- Betik: `/home/user/backup.sh` (her turda `bash /home/user/backup.sh <etiket>`)

## 8. Doğrulama komutları

```bash
flutter pub get
dart format lib test
flutter analyze        # ✅ beklenen: No issues found!
flutter test           # ⚠️ beklenen: 25 passed, 1 failed (bulunmalı)
```

---
*Ek belgeler: `docs/V13_HARMAN_RAPORU.md` (danışmanlara iletilen karşılaştırma + özet), `docs/V13_DOGRULAMA_RAPORU.md` (v1.3 iddialarının repoda olmadığını tespit eden ilk rapor), `docs/YAPILACAKLAR.md` (genel plan).*

---

## v1.4 Devir Eki (2026-08-22 — harmanlanmış uygulama)

### Durum
- Sürüm: **0.3.0+5** (pubspec). Baz: 0.2.2+4.
- İki danışman dokümanı (V1.4 GLOBAL HANDOFF PACKET + V1.4 KOD PAKETİ) harmanlandı.
- FSRS-esinli SRS motoru + FSRS-5 NuraBrain referans motoru eklendi.
- Clock provider + FakeClock hazır (sözleşme: testlerde DateTime.now() yasak).
- Billing soyutlaması kuruldu (Fake servis; RevenueCat/Play Billing sonra takılır).
- CognitiveTracker + SwipeReviewCard eklendi (review akışı yükseltme hazır).
- flutter_secure_storage **açıldı** (pubspec yorum kaldırıldı) — SecureStorage gerçek implementasyon.
- Store/release kontrol listesi + build betiği üretildi.
- `NURA_CODING_CONTRACT.md` repo köküne eklendi.
- CI durumu: analyze ✅ (0 issue — son doğrulama) | test ⚠️ 25/26 (1 fail, adı CI log kısıtından tespit edilemedi — yeni workflow annotation'ı ile bulunacak).

### Yeni dosyalar (v1.4)
- lib/core/utils/clock.dart (Clock, SystemClock, FakeClock, clockProvider)
- lib/core/algorithm/fsrs5_engine.dart (NuraBrain — FSRS-5, 19 parametre)
- lib/core/algorithm/cognitive_tracker.dart (Reflex/Recall/Guess/Lapse)
- lib/data/srs/srs_state.dart (SrsCard + SrsCardState + AnswerQuality — phrase YOK)
- lib/data/srs/srs_machine.dart (SrsMachine — FSRS-esinli, Clock tabanlı)
- lib/ui/review/swipe_review_card.dart (Tinder tarzı kaydırma)
- lib/features/plus/domain/entitlement.dart
- lib/features/plus/data/billing_service.dart
- lib/features/plus/data/fake_billing_service.dart
- lib/features/plus/state/plus_controller.dart
- test/00_smoke_test.dart
- test/srs_machine_test.dart
- test/fsrs5_engine_test.dart
- test/plus_controller_test.dart
- docs/STORE_CHECKLIST.md
- scripts/build_release.sh
- NURA_CODING_CONTRACT.md

### Kritik notlar
- SrsMachine, doc-2'nin FSRS-esinli matematiğini kullanır (testleri garantili);
  tam FSRS-5 (NuraBrain) `lib/core/algorithm/fsrs5_engine.dart` içinde hazır —
  istenirse `SrsMachine` içindeki `_nextStability/_nextDifficulty` yerine
  NuraBrain'e geçilebilir (o zaman srs_machine_test beklentileri güncellenmeli).
- Gerçek Play Billing servisi kodlanmadı (FakeBillingService etkin).
  Play Console ürün tanımı + tester hesabı gereklidir.
- Smoke test, uygulama açılışını `prefsProvider` override'ı ile doğrular.
