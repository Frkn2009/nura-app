import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/achievements/achievements_screen.dart';
import '../../features/alphabet/alphabet_screen.dart';
import '../../features/games/daily_wheel_screen.dart';
import '../../features/ads/ad_gate_screen.dart';
import '../../features/auth/auth_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/clips/clips_screen.dart';
import '../../features/clan/clan_screen.dart';
import '../../features/events/weekly_event_screen.dart';
import '../../features/family/family_profiles_screen.dart';
import '../../features/legal/privacy_screen.dart';
import '../../features/leaderboard/leaderboard_screen.dart';
import '../../features/guide/language_guide_screen.dart';
import '../../features/games/games_screen.dart';
import '../../features/games/treasure_chest.dart';
import '../../features/home/home_screen.dart';
import '../../features/learn/learning_path_screen.dart';
import '../../features/onboarding/onboarding_flow.dart';
import '../../features/paywall/paywall_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/review/review_screen.dart';
import '../../features/shell/app_shell.dart';
import '../../features/speak/speak_screens.dart';
import '../../features/stories/ebook_library_screen.dart';
import '../../features/translate/translate_screen.dart';
import '../../state/session.dart';

final _root = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final onboarded = ref.watch(sessionProvider.select((s) => s.onboarded));
  return GoRouter(
    navigatorKey: _root,
    initialLocation: onboarded ? '/app' : '/onboarding',
    routes: [
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingFlow()),
      GoRoute(path: '/login', parentNavigatorKey: _root, builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/paywall', parentNavigatorKey: _root, builder: (_, __) => const PaywallScreen()),
      GoRoute(path: '/ad', parentNavigatorKey: _root, builder: (_, __) => const AdGateScreen()),
      GoRoute(path: '/review', parentNavigatorKey: _root, builder: (_, __) => const ReviewScreen()),
      GoRoute(path: '/clips', parentNavigatorKey: _root, builder: (_, __) => const ClipsScreen()),
      GoRoute(path: '/guide', parentNavigatorKey: _root, builder: (_, __) => const LanguageGuideScreen()),
      GoRoute(path: '/leaderboard', parentNavigatorKey: _root, builder: (_, __) => const LeaderboardScreen()),
      GoRoute(path: '/event', parentNavigatorKey: _root, builder: (_, __) => const WeeklyEventScreen()),
      GoRoute(path: '/family', parentNavigatorKey: _root, builder: (_, __) => const FamilyProfilesScreen()),
      GoRoute(path: '/clan', parentNavigatorKey: _root, builder: (_, __) => const ClanScreen()),
      GoRoute(path: '/achievements', parentNavigatorKey: _root, builder: (_, __) => const AchievementsScreen()),
      GoRoute(path: '/alphabet', parentNavigatorKey: _root, builder: (_, s) => AlphabetScreen(langCode: s.uri.queryParameters['lang'] ?? 'en')),
      GoRoute(path: '/alphabet/:lang', parentNavigatorKey: _root, builder: (_, s) => AlphabetScreen(langCode: s.pathParameters['lang']!)),
      GoRoute(path: '/wheel', parentNavigatorKey: _root, builder: (_, __) => const DailyWheelScreen()),
      GoRoute(path: '/path', parentNavigatorKey: _root, builder: (_, __) => const LearningPathScreen()),
      GoRoute(path: '/stories', parentNavigatorKey: _root, builder: (_, __) => const EbookLibraryScreen()),
      GoRoute(path: '/chest', parentNavigatorKey: _root, builder: (_, __) => const TreasureChestScreen()),
      GoRoute(path: '/privacy', parentNavigatorKey: _root, builder: (_, __) => const PrivacyScreen()),
      GoRoute(path: '/auth', parentNavigatorKey: _root, builder: (_, __) => const AuthScreen()),
      GoRoute(
        path: '/session',
        parentNavigatorKey: _root,
        builder: (_, s) => SpeakSessionScreen(scenarioId: s.uri.queryParameters['id'] ?? ''),
      ),
      ShellRoute(
        builder: (_, __, child) => AppShell(child: child),
        routes: [
          GoRoute(path: '/app', builder: (_, __) => const HomeScreen()),
          GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
          GoRoute(path: '/app/speak', builder: (_, __) => const SpeakHubScreen()),
          GoRoute(path: '/app/games', builder: (_, __) => const GamesScreen()),
          GoRoute(path: '/app/translate', builder: (_, __) => const TranslateScreen()),
          GoRoute(path: '/app/you', builder: (_, __) => const ProfileScreen()),
        ],
      ),
    ],
  );
});
