import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n.dart';
import '../../core/theme/tokens.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// Tablet/büyük ekran eşiği (Material large-screen breakpoint'i, 600dp).
const _wideBreakpoint = 600.0;

/// İçeriğin geniş ekranlarda kenardan kenara gerilmemesi için üst sınır.
const _contentMaxWidth = 900.0;

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.child});
  final Widget child;

  static const _paths = [
    '/app',
    '/app/speak',
    '/app/games',
    '/app/chat',
    '/app/translate',
    '/app/you',
  ];

  int _indexFor(String location) {
    if (location.startsWith('/app/speak')) return 1;
    if (location.startsWith('/app/games')) return 2;
    if (location.startsWith('/app/chat')) return 3;
    if (location.startsWith('/app/translate')) return 4;
    if (location.startsWith('/app/you')) return 5;
    return 0;
  }

  List<({IconData icon, IconData selected, Color color, String label})>
  _destinations(I18n i18n) => [
    (
      icon: Icons.home_outlined,
      selected: Icons.home,
      color: Voxelo.mint,
      label: i18n.home,
    ),
    (
      icon: Icons.mic_none,
      selected: Icons.mic,
      color: Voxelo.mint,
      label: i18n.speak,
    ),
    (
      icon: Icons.sports_esports_outlined,
      selected: Icons.sports_esports,
      color: Voxelo.coral,
      label: 'Oyun',
    ),
    (
      icon: Icons.forum_outlined,
      selected: Icons.forum,
      color: Voxelo.coral,
      label: 'Sohbet',
    ),
    (
      icon: Icons.translate_outlined,
      selected: Icons.translate,
      color: Voxelo.mint,
      label: i18n.translate,
    ),
    (
      icon: Icons.person_outline,
      selected: Icons.person,
      color: Voxelo.mint,
      label: i18n.you,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final index = _indexFor(GoRouterState.of(context).uri.path);
    final destinations = _destinations(i18n);
    final wide = MediaQuery.sizeOf(context).width >= _wideBreakpoint;

    final content = Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
        child: child,
      ),
    );

    if (!wide) {
      return Scaffold(
        appBar: VoxeloAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 88),
          child: content,
        ),
        extendBody: true,
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(Voxelo.radiusPill),
              boxShadow: Voxelo.softShadow,
            ),
            clipBehavior: Clip.antiAlias,
            child: NavigationBar(
              selectedIndex: index,
              backgroundColor: Colors.transparent,
              indicatorColor: Theme.of(
                context,
              ).navigationBarTheme.indicatorColor,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              onDestinationSelected: (i) => context.go(_paths[i]),
              destinations: [
                for (final d in destinations)
                  NavigationDestination(
                    icon: Icon(d.icon),
                    selectedIcon: Icon(d.selected, color: d.color),
                    label: d.label,
                  ),
              ],
            ),
          ),
        ),
      );
    }

    // Tablet/geniş ekran: alt bar yerine yan NavigationRail (Material
    // large-screen kılavuzu) + içerik ortalanıp gereksiz gerilmiyor.
    return Scaffold(
      appBar: VoxeloAppBar(),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: index,
            labelType: NavigationRailLabelType.all,
            backgroundColor: Theme.of(
              context,
            ).navigationBarTheme.backgroundColor,
            onDestinationSelected: (i) => context.go(_paths[i]),
            destinations: [
              for (final d in destinations)
                NavigationRailDestination(
                  icon: Icon(d.icon),
                  selectedIcon: Icon(d.selected, color: d.color),
                  label: Text(d.label),
                ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(child: content),
        ],
      ),
    );
  }
}
