import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/achievements/achievements_screen.dart';
import '../../features/ads/ad_gate_screen.dart';
import '../../features/auth/auth_screen.dart';
import '../../features/clips/clips_screen.dart';
import '../../features/clan/clan_screen.dart';
import '../../features/events/weekly_event_screen.dart';
import '../../features/family/family_profiles_screen.dart';
import '../../features/legal/legal_screen.dart';
import '../../features/leaderboard/leaderboard_screen.dart';
import '../../features/guide/language_guide_screen.dart';
import '../../features/games/games_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/onboarding/onboarding_flow.dart';
import '../../features/paywall/paywall_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/review/review_screen.dart';
import '../../features/shell/app_shell.dart';
import '../../features/speak/speak_screens.dart';
import '../../features/translate/translate_screen.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

final _root = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final onboarded = ref.watch(sessionProvider.select((s) => s.onboarded));
  return GoRouter(
    navigatorKey: _root,
    initialLocation: onboarded ? '/app' : '/onboarding',
    routes: [
      GoRoute(path: '/onboarding', builder: (_, _) => const OnboardingFlow()),
      GoRoute(path: '/paywall', parentNavigatorKey: _root, builder: (_, _) => const PaywallScreen()),
      GoRoute(path: '/ad', parentNavigatorKey: _root, builder: (_, _) => const AdGateScreen()),
      GoRoute(path: '/review', parentNavigatorKey: _root, builder: (_, _) => const ReviewScreen()),
      GoRoute(path: '/clips', parentNavigatorKey: _root, builder: (_, _) => const ClipsScreen()),
      GoRoute(path: '/guide', parentNavigatorKey: _root, builder: (_, _) => const LanguageGuideScreen()),
      GoRoute(path: '/leaderboard', parentNavigatorKey: _root, builder: (_, _) => const LeaderboardScreen()),
      GoRoute(path: '/event', parentNavigatorKey: _root, builder: (_, _) => const WeeklyEventScreen()),
      GoRoute(path: '/family', parentNavigatorKey: _root, builder: (_, _) => const FamilyProfilesScreen()),
      GoRoute(path: '/clan', parentNavigatorKey: _root, builder: (_, _) => const ClanScreen()),
      GoRoute(path: '/achievements', parentNavigatorKey: _root, builder: (_, _) => const AchievementsScreen()),
      GoRoute(
        path: '/privacy',
        parentNavigatorKey: _root,
        builder: (_, _) => const LegalScreen(type: LegalType.privacy),
      ),
      GoRoute(
        path: '/terms',
        parentNavigatorKey: _root,
        builder: (_, _) => const LegalScreen(type: LegalType.terms),
      ),
      GoRoute(path: '/auth', parentNavigatorKey: _root, builder: (_, _) => const AuthScreen()),
      GoRoute(
        path: '/session',
        parentNavigatorKey: _root,
        builder: (_, s) => SpeakSessionScreen(scenarioId: s.uri.queryParameters['id'] ?? ''),
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: '/app', builder: (_, _) => const HomeScreen())],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/app/speak', builder: (_, _) => const SpeakHubScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/app/games', builder: (_, _) => const GamesScreen())],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/app/translate', builder: (_, _) => const TranslateScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/app/you', builder: (_, _) => const ProfileScreen())],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorState(message: 'Sayfa bulunamadı'),
  );
});
