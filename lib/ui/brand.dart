import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';

/// NURA'nın özgün marka işareti.
///
/// İki sağlam sütunu birleştiren yükselen çizgi, konuşarak kurulan bağı ve
/// öğrenme ilerlemesini temsil eder. Tamamen Flutter ile çizildiği için ekran
/// yoğunluğundan bağımsız olarak net kalır ve harici/telifli varlık kullanmaz.
class NuraMark extends StatelessWidget {
  const NuraMark({
    super.key,
    this.size = 32,
    this.onDark = false,
  });

  final double size;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'NURA',
      image: true,
      child: SizedBox.square(
        dimension: size,
        child: CustomPaint(painter: _NuraMarkPainter(onDark: onDark)),
      ),
    );
  }
}

class _NuraMarkPainter extends CustomPainter {
  const _NuraMarkPainter({required this.onDark});

  final bool onDark;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final radius = Radius.circular(size.width * .30);
    final background = Paint()..color = onDark ? Colors.white : Nura.mintDark;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), background);

    final stroke = size.width * .105;
    final line = Paint()
      ..color = onDark ? Nura.mintDark : Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final leftX = size.width * .29;
    final rightX = size.width * .71;
    final top = size.height * .25;
    final bottom = size.height * .75;
    final n = Path()
      ..moveTo(leftX, bottom)
      ..lineTo(leftX, top)
      ..lineTo(rightX, bottom)
      ..lineTo(rightX, top);
    canvas.drawPath(n, line);

    canvas.drawCircle(
      Offset(size.width * .78, size.height * .20),
      size.width * .055,
      Paint()..color = Nura.coral,
    );
  }

  @override
  bool shouldRepaint(covariant _NuraMarkPainter oldDelegate) =>
      oldDelegate.onDark != onDark;
}

class NuraWordmark extends StatelessWidget {
  const NuraWordmark({
    super.key,
    this.onDark = false,
    this.compact = false,
  });

  final bool onDark;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final foreground = onDark ? Colors.white : Nura.ink;
    return Semantics(
      label: 'NURA',
      header: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          NuraMark(size: compact ? 28 : 32, onDark: onDark),
          const SizedBox(width: 9),
          Text(
            'NURA',
            style: TextStyle(
              color: foreground,
              fontFamily: 'Inter',
              fontSize: compact ? 17 : 19,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}

/// Tüm sayfalarda marka görünürlüğünü ve başlık düzenini standartlaştırır.
class NuraAppBar extends AppBar {
  NuraAppBar({
    super.key,
    Widget? pageTitle,
    super.leading,
    super.actions,
    super.backgroundColor,
    super.foregroundColor,
    super.automaticallyImplyLeading,
  }) : super(
          titleSpacing: 16,
          title: _NuraAppBarTitle(
            pageTitle: pageTitle,
            onDark: backgroundColor == Nura.forest ||
                backgroundColor == Nura.mintDark,
          ),
        );
}

class _NuraAppBarTitle extends StatelessWidget {
  const _NuraAppBarTitle({required this.pageTitle, required this.onDark});

  final Widget? pageTitle;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NuraWordmark(onDark: onDark, compact: true),
        if (pageTitle != null) ...[
          Container(
            width: 1,
            height: 22,
            margin: const EdgeInsets.symmetric(horizontal: 11),
            color: onDark ? Colors.white24 : Nura.fog,
          ),
          Flexible(
            child: DefaultTextStyle.merge(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              child: pageTitle!,
            ),
          ),
        ],
      ],
    );
  }
}
