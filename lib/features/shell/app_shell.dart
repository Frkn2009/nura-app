import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../state/session.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final loc = GoRouterState.of(context).uri.path;
    int index = 0;
    if (loc.startsWith('/app/speak')) index = 1;
    if (loc.startsWith('/app/clips')) index = 2;
    if (loc.startsWith('/app/translate')) index = 3;
    if (loc.startsWith('/app/you')) index = 4;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        backgroundColor: Nura.cream2,
        indicatorColor: Nura.pale,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (i) {
          const paths = ['/app', '/app/speak', '/app/clips', '/app/translate', '/app/you'];
          context.go(paths[i]);
        },
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_outlined), selectedIcon: const Icon(Icons.home), label: i18n.home),
          NavigationDestination(icon: const Icon(Icons.mic_none), selectedIcon: const Icon(Icons.mic), label: i18n.speak),
          NavigationDestination(icon: const Icon(Icons.movie_outlined), selectedIcon: const Icon(Icons.movie), label: i18n.clips),
          NavigationDestination(icon: const Icon(Icons.translate_outlined), selectedIcon: const Icon(Icons.translate), label: i18n.translate),
          NavigationDestination(icon: const Icon(Icons.person_outline), selectedIcon: const Icon(Icons.person), label: i18n.you),
        ],
      ),
    );
  }
}
