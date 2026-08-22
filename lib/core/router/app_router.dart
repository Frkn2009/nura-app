import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/auth/presentation/auth_gate.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/onboarding/new_onboarding.dart';
import '../../features/alphabet/alphabet_screen.dart';
import '../../features/alphabet/letter_practice_screen.dart';
import '../../features/learn/learning_path_screen.dart';
import '../../features/games/daily_wheel_screen.dart';
import '../../features/games/treasure_chest.dart';
import '../../features/stories/story_reader_screen.dart';
import '../../features/stories/ebook_library_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
    GoRoute(path: '/onboarding', builder: (_, __) => const NewOnboarding()),
    ShellRoute(
      builder: (_, __, child) => AuthGate(child: child),
      routes: [
        GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
        GoRoute(path: '/path', builder: (_, __) => const LearningPathScreen()),
        GoRoute(
          path: '/alphabet/:lang',
          builder: (_, s) => AlphabetScreen(langCode: s.pathParameters['lang']!),
        ),
        GoRoute(
          path: '/practice/:lang/:word',
          builder: (_, s) => LetterPracticeScreen(
            langCode: s.pathParameters['lang']!,
            word: s.pathParameters['word']!,
          ),
        ),
        GoRoute(path: '/wheel', builder: (_, __) => const DailyWheelScreen()),
        GoRoute(path: '/chest', builder: (_, __) => const TreasureChestScreen()),
        GoRoute(path: '/stories', builder: (_, __) => const EbookLibraryScreen()),
        GoRoute(
          path: '/story/:id',
          builder: (_, s) => StoryReaderScreen(storyId: s.pathParameters['id']!),
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    final loggedIn = Supabase.instance.client.auth.currentUser != null;
    if (state.matchedLocation == '/login' && loggedIn) return '/home';
    return null;
  },
);
