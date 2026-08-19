import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/ads/ad_gate_screen.dart';
import '../../features/legal/privacy_screen.dart';
import '../../features/guide/language_guide_screen.dart';
import '../../features/clips/clips_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/onboarding/onboarding_flow.dart';
import '../../features/paywall/paywall_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/review/review_screen.dart';
import '../../features/shell/app_shell.dart';
import '../../features/speak/speak_screens.dart';
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
      GoRoute(path: '/paywall', parentNavigatorKey: _root, builder: (_, __) => const PaywallScreen()),
      GoRoute(path: '/ad', parentNavigatorKey: _root, builder: (_, __) => const AdGateScreen()),
      GoRoute(path: '/review', parentNavigatorKey: _root, builder: (_, __) => const ReviewScreen()),
      GoRoute(path: '/guide', parentNavigatorKey: _root, builder: (_, __) => const LanguageGuideScreen()),
      GoRoute(path: '/privacy', parentNavigatorKey: _root, builder: (_, __) => const PrivacyScreen()),
      GoRoute(
        path: '/session',
        parentNavigatorKey: _root,
        builder: (_, s) => SpeakSessionScreen(scenarioId: s.uri.queryParameters['id'] ?? ''),
      ),
      ShellRoute(
        builder: (_, __, child) => AppShell(child: child),
        routes: [
          GoRoute(path: '/app', builder: (_, __) => const HomeScreen()),
          GoRoute(path: '/app/speak', builder: (_, __) => const SpeakHubScreen()),
          GoRoute(path: '/app/clips', builder: (_, __) => const ClipsScreen()),
          GoRoute(path: '/app/translate', builder: (_, __) => const TranslateScreen()),
          GoRoute(path: '/app/you', builder: (_, __) => const ProfileScreen()),
        ],
      ),
    ],
  );
});
