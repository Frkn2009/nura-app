import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/tokens.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _getIndex(BuildContext context) {
    final loc = GoRouterState.of(context).uri.path;
    if (loc.startsWith('/learn')) return 1;
    if (loc.startsWith('/review')) return 2;
    if (loc.startsWith('/profile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final index = _getIndex(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        height: 70,
        backgroundColor: NuraTokens.surface,
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.1),
        onDestinationSelected: (i) {
          switch (i) {
            case 0: context.go('/home'); break;
            case 1: context.go('/learn'); break;
            case 2: context.go('/review'); break;
            case 3: context.go('/profile'); break;
          }
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined, size: 28),
            selectedIcon: const Icon(Icons.home, size: 28, color: NuraTokens.primary),
            label: 'Ana Sayfa',
            labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 12),
          ),
          NavigationDestination(
            icon: const Icon(Icons.menu_book_outlined, size: 28),
            selectedIcon: const Icon(Icons.menu_book, size: 28, color: NuraTokens.accent),
            label: 'Öğren',
            labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 12),
          ),
          NavigationDestination(
            icon: const Icon(Icons.replay_outlined, size: 28),
            selectedIcon: const Icon(Icons.replay, size: 28, color: NuraTokens.danger),
            label: 'Tekrar',
            labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 12),
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline, size: 28),
            selectedIcon: const Icon(Icons.person, size: 28, color: NuraTokens.gold),
            label: 'Profil',
            labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
