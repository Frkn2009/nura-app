import 'package:flutter/material.dart';
import '../core/theme/tokens.dart';

/// NURA Logo — her sayfada sol üstte görünür
class NuraLogo extends StatelessWidget {
  const NuraLogo({super.key, this.size = 28});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'N',
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w900,
            color: Nura.mint,
            fontFamily: 'Inter',
            letterSpacing: -1,
          ),
        ),
        Text(
          'URA',
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w900,
            color: Nura.ink,
            fontFamily: 'Inter',
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }
}

/// NURA AppBar — logo sol üstte, her sayfada kullanılabilir
class NuraAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NuraAppBar({super.key, this.actions, this.showBack = false});
  final List<Widget>? actions;
  final bool showBack;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBack,
      title: const NuraLogo(),
      actions: actions,
    );
  }
}
