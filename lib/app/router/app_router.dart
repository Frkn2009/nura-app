import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/home_screen.dart';
import '../../features/learn/learning_path_screen.dart';
import '../../features/learn/phrasebook_screen.dart';
import '../../features/alphabet/alphabet_screen.dart';
import '../../features/alphabet/letter_practice_screen.dart';
import '../../features/review/quiz_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/games/daily_wheel_screen.dart';
import '../../features/stories/story_reader_screen.dart';
import '../../features/onboarding/new_onboarding.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/auth_gate.dart';
import '../../features/plus/plus_screen.dart';
import '../shell/main_shell.dart';

final GlobalKey<NavigatorState> _rootNav = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNav = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNav,
  initialLocation: '/onboarding',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    // Auth kontrolü burada yapılacak
    // final isLoggedIn = ref.read(authProvider) != null;
    // if (!isLoggedIn && !state.uri.path.startsWith('/onboarding') && !state.uri.path.startsWith('/login')) {
    //   return '/login';
    // }
    return null;
  },
  routes: [
    // PUBLİK ROTALAR (Auth gerektirmez)
    GoRoute(path: '/onboarding', builder: (_, __) => const NewOnboarding()),
    GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
    
    // SHELL ROTALAR (Alt navigasyon bar ile)
    ShellRoute(
      navigatorKey: _shellNav,
      builder: (_, __, child) => AuthGate(child: MainShell(child: child)),
      routes: [
        // ANA SAYFA
        GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
        
        // ÖĞRENME YOLU
        GoRoute(
          path: '/learn',
          builder: (_, __) => const LearningPathScreen(),
          routes: [
            GoRoute(path: 'alphabet/:langCode', builder: (_, state) => AlphabetScreen(langCode: state.pathParameters['langCode']!)),
            GoRoute(path: 'alphabet/:langCode/practice', builder: (_, state) => LetterPracticeScreen(word: 'ماء', langCode: state.pathParameters['langCode']!)),
            GoRoute(path: 'phrasebook', builder: (_, __) => const PhrasebookScreen()),
            GoRoute(path: 'stories', builder: (_, __) => StoryReaderScreen(title: 'İlk Hikayem', words: ['Merhaba', 'Dünya'], langCode: 'tr')),
          ],
        ),
        
        // QUİZ / REVIEW
        GoRoute(
          path: '/review',
          builder: (_, __) => const QuizScreen(),
        ),
        
        // PROFIL
        GoRoute(
          path: '/profile',
          builder: (_, __) => const ProfileScreen(),
          routes: [
            GoRoute(path: 'settings', builder: (_, __) => const SettingsScreen()),
            GoRoute(path: 'plus', builder: (_, __) => const PlusScreen()),
          ],
        ),
      ],
    ),
    
    // MODAL/POPUP ROTALAR (Tam ekran)
    GoRoute(path: '/wheel', builder: (_, __) => const DailyWheelScreen()),
  ],
);
