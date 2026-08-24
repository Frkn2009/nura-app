# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter pub get                 # install dependencies
flutter run                     # run on connected device/emulator (use `-d chrome` for web)
flutter analyze                 # static analysis — must be clean before committing
dart format .                   # format
flutter test                    # run all tests
flutter test test/srs_machine_test.dart          # run a single test file
flutter test --plain-name "Good increases stability"  # run a single test by name
```

Release build (also see `scripts/build_release.sh`, which chains format → analyze → test → build appbundle/apk):

```bash
flutter build appbundle --release
flutter build apk --release --no-tree-shake-icons
```

Windows note: this repo has been developed against `C:\nura-app` with `PUB_CACHE=C:\pub-cache` set, to avoid pub cache issues caused by non-ASCII characters in Windows user profile paths. **This applies to `flutter build` too, not just `flutter test`** — the Dart AOT snapshotter fails to read `.dart_tool/flutter_build/.../app.dill` when the project's own path contains non-ASCII characters, so `flutter build apk/appbundle --release` must also be run from an ASCII-only clone (e.g. `git clone` the repo into `C:\nura-build`). The Android SDK must also live at an ASCII path (`ANDROID_HOME`/`ANDROID_SDK_ROOT` + `android/local.properties`'s `sdk.dir`), and `android/gradle.properties` needs `android.overridePathCheck=true` since AGP itself also rejects non-ASCII project paths independently of the AOT issue. `pubspec.yaml` pins `path_provider_foundation: 2.5.1` via `dependency_overrides` — newer versions depend on the `objective_c` package's native-assets build hook, which fails to compile under the currently-pinned Flutter SDK's hooks/code_assets protocol regardless of target platform (a real upstream bug, not a path issue) — don't remove this override without confirming upstream is fixed. `key.properties` and `android/app/upload-keystore.jks` are gitignored and won't come along with a fresh clone; copy them manually before a release build.

There is no CI config in this repo; `flutter analyze` and `flutter test` are the only correctness gates.

## Architecture

NURA is a Flutter language-learning app (30 UI languages, Riverpod state, GoRouter navigation, optional Supabase backend). It is designed to work fully offline/local-first: Supabase sync is an enhancement layered on top, not a hard dependency.

### Layering and folder boundaries

Code lives under four top-level buckets and files must not be created outside them (`lib/core`, `lib/data`, `lib/features`, `lib/ui`, plus `lib/state`):

- `core/` — cross-cutting engines with no UI: `algorithm/` (FSRS-5 SRS engine, cognitive tracker), `l10n/i18n.dart`, `router/app_router.dart`, `theme/` (design tokens + light/dark ThemeData), `utils/clock.dart`, `supabase_config.dart`.
- `data/` — models, repositories, and service wrappers grouped by domain (`ads/`, `content/`, `events/`, `models/`, `notifications/`, `speech/`, `srs/`, `supabase/`, `translate/`, `widgets/`).
- `features/<name>/` — one folder per product feature (e.g. `speak`, `games`, `plus`, `ai`, `alphabet`, `onboarding`), typically split internally into `data/`, `domain/`, `state/`, `screen(s)`.
- `ui/` — shared presentational widgets not tied to one feature (brand/logo, mascot, review card).
- `state/session.dart` — the single global `UserProfile` state (Riverpod `NotifierProvider`), persisted to `SharedPreferences` and optionally pushed to Supabase. Most cross-feature state (XP, streak, SRS due dates, achievements, family profiles, Plus entitlement flags) flows through `SessionController` in this file rather than per-feature stores.

### Composition root

`main.dart` initializes Supabase (only if `SupaConfig.isSet`), notifications, and `SharedPreferences`, then boots `ProviderScope` with `prefsProvider` overridden to the real instance. `app.dart`'s `NuraApp` watches `routerProvider` and the session's `themePreference` to drive `MaterialApp.router`. Routing (`core/router/app_router.dart`) is a single `GoRouter`: onboarding/auth/paywall/games/etc. are top-level routes on the root navigator, while the 5-tab main app (home/speak/games/translate/profile) is a `ShellRoute` wrapped by `features/shell/app_shell.dart`.

### Coding contract (enforced by convention, not lint — see `NURA_CODING_CONTRACT.md`)

1. State management is Riverpod only; `setState` is only acceptable inside a `StatefulWidget` for pure local UI state.
2. SRS/spaced-repetition logic goes only through `NuraBrain`/`SrsMachine` (`core/algorithm/fsrs5_engine.dart`, `data/srs/srs_machine.dart`) — this is FSRS-5/FSRS-inspired, not SM-2. `SrsCard` (`data/srs/srs_state.dart`) has no `phrase` field.
3. No hardcoded UI strings — all copy goes through `I18n` (`core/l10n/i18n.dart`), which looks up a `Map<String, String>` keyed by `UiLang` name and falls back to `'en'` then the map's first value. Note only a subset of the 30 UI languages have translations filled in for every string; the fallback chain is intentional, not a bug.
4. No hardcoded colors — use `NuraTokens` (`core/theme/tokens.dart`) only.
5. Code that depends on wall-clock time must go through the `Clock` abstraction (`core/utils/clock.dart`), not `DateTime.now()` directly, so tests can use `FakeClock`. Tests also call `SharedPreferences.setMockInitialValues({})` (or override `prefsProvider`) instead of touching real prefs. Note: a fair amount of existing code in `state/session.dart` calls `DateTime.now()` directly and predates full adoption of this rule — new code should still follow it.
6. Billing/entitlement checks go through `PlusController`/`BillingService` (`features/plus/`), never a client-side `isPlus` shortcut. `FakeBillingService` is the test/dev implementation of `BillingService`.
7. The review flow reuses `SwipeReviewCard` (`ui/review/swipe_review_card.dart`) and `CognitiveTracker` (`core/algorithm/cognitive_tracker.dart`).
8. TTS voice is always female (see speech config in `data/speech/`).
9. All mascot/game-mechanic/visual design work must be original, not copied from competitors.

### Supabase

`core/supabase_config.dart` holds the project URL/publishable key; `SupaConfig.isSet` gates whether cloud sync initializes at all — with it unset the app runs fully local. `data/supabase/supa_service.dart` (`Supa`) is the sync layer that `SessionController._save` pushes profile/XP/family-profile writes to when `Supa.enabled`, always via `unawaited(...).catchError((_) {})` so cloud failures never block local state. Edge functions live in `supabase/functions/` (e.g. `translate`, used for Plus cloud translation so the provider API key never ships in the client); `supabase_setup.sql` and `supabase/leaderboard.sql` define the schema/RLS. Plus entitlement is authoritative only from the `subscriptions` table written by the payment webhook's service role — never from client-editable profile data.

### Content and monetization model

- Free tier: 60 seconds/day of speaking practice (on-device, ~$0 cost), extendable by watching a rewarded ad (max 3/day) or upgrading to Plus.
- AdMob: repo ships Google's test App ID/ad unit IDs by default; production IDs are injected at build time via `--dart-define` (see README) and must replace the test App IDs in `AndroidManifest.xml`/`Info.plist` before a store release.

## Where to look for project status/history

The docs below are living project logs kept by the repo owner (mostly in Turkish) and are useful for background, but treat their "current state" claims (test counts, file counts, feature checklists, theme color names) as potentially stale — verify against actual code rather than trusting them outright:

- `docs/YAPILACAKLAR.md`, `docs/DEVAM_SAYFASI.md` — task/status logs.
- `docs/RAKIP_ANALIZ_VE_PLAN.md`, `docs/ECONOMICS.md`, `docs/BUTCE_VE_ASO.md` — product/market notes.
- `docs/STORE_CHECKLIST.md` — store release checklist.
- `NURA_V14_HANDOFF_PACKET.md` — architecture handoff summary.
- `AI_PROMPT.md`, `MEGA_PROMPT.md` — copy-paste prompts previously used to hand this project to an AI assistant; not authoritative specs.
