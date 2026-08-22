import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final loc = GoRouterState.of(context).uri.path;
    int index = 0;
    if (loc.startsWith('/app/speak')) index = 1;
    if (loc.startsWith('/app/games')) index = 2;
    if (loc.startsWith('/app/translate')) index = 3;
    if (loc.startsWith('/app/you')) index = 4;

    return Scaffold(
      appBar: NuraAppBar(),
      // StatefulShellRoute.indexedStack → her sekmenin durumu (kaydırma,
      // form, oyun vb.) sekme değişse de korunur.
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
        indicatorColor: Theme.of(context).navigationBarTheme.indicatorColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (i) =>
            navigationShell.goBranch(i, initialLocation: i == navigationShell.currentIndex),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home, color: Nura.mint), label: i18n.home),
          NavigationDestination(icon: const Icon(Icons.mic_none), selectedIcon: Icon(Icons.mic, color: Nura.mint), label: i18n.speak),
          const NavigationDestination(icon: Icon(Icons.sports_esports_outlined), selectedIcon: Icon(Icons.sports_esports, color: Nura.coral), label: 'Oyun'),
          NavigationDestination(icon: const Icon(Icons.translate_outlined), selectedIcon: Icon(Icons.translate, color: Nura.mint), label: i18n.translate),
          NavigationDestination(icon: const Icon(Icons.person_outline), selectedIcon: Icon(Icons.person, color: Nura.mint), label: i18n.you),
        ],
      ),
    );
  }
}
