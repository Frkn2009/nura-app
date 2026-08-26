import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';

/// NURA'nın özgün marka işareti: bir konuşma balonu içinde ses ritmi.
///
/// Harf tabanlı bir monogram yerine doğrudan "konuşma"yı temsil eder, bu
/// yüzden en küçük ölçekte (uygulama simgesi) bile dil bağımsız okunur.
/// Tamamen Flutter ile çizildiği için ekran yoğunluğundan bağımsız net
/// kalır ve harici/telifli varlık kullanmaz.
class NuraMark extends StatelessWidget {
  const NuraMark({super.key, this.size = 32, this.onDark = false});

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

/// Marka işareti: "Konuşma Ritmi" — bir konuşma balonunun içinde bir
/// ses dalgası/ekolayzır. Harf yok, direkt "konuşma" fikrinin kendisi;
/// önceki "N" harf monogramından farklı olarak en küçük ölçekte bile
/// (uygulama simgesi boyutunda) neyi temsil ettiği çeviri gerektirmeden
/// okunuyor.
class _NuraMarkPainter extends CustomPainter {
  const _NuraMarkPainter({required this.onDark});

  final bool onDark;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final rect = Offset.zero & size;
    final radius = Radius.circular(w * .24);

    final backgroundColor = onDark ? Colors.white : Nura.mintDark;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, radius),
      Paint()..color = backgroundColor,
    );

    final bubbleColor = onDark ? Nura.mintDark : Colors.white;
    final bubbleRect = Rect.fromLTWH(w * .15, w * .19, w * .70, w * .48);
    final bubbleRRect = RRect.fromRectAndRadius(
      bubbleRect,
      Radius.circular(w * .13),
    );
    final tail = Path()
      ..moveTo(w * .30, w * .655)
      ..lineTo(w * .225, w * .80)
      ..lineTo(w * .41, w * .655)
      ..close();
    final bubblePath = Path()
      ..addRRect(bubbleRRect)
      ..addPath(tail, Offset.zero);
    canvas.drawPath(bubblePath, Paint()..color = bubbleColor);

    // Balonun içindeki 4 çubuklu ekolayzır — sırayla zemin/mercan/
    // zemin/altın renginde, değişen yüksekliklerde bir konuşma ritmi.
    final barColors = [backgroundColor, Nura.coral, backgroundColor, Nura.gold];
    const heightsRatio = [0.15, 0.30, 0.19, 0.25];
    final barWidth = w * .065;
    final gap = w * .05;
    final totalWidth = barWidth * 4 + gap * 3;
    var x = bubbleRect.center.dx - totalWidth / 2;
    final centerY = bubbleRect.center.dy;
    for (var i = 0; i < 4; i++) {
      final h = heightsRatio[i] * w;
      final barRect = Rect.fromCenter(
        center: Offset(x + barWidth / 2, centerY),
        width: barWidth,
        height: h,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(barRect, Radius.circular(barWidth / 2)),
        Paint()..color = barColors[i],
      );
      x += barWidth + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _NuraMarkPainter oldDelegate) =>
      oldDelegate.onDark != onDark;
}

class NuraWordmark extends StatelessWidget {
  const NuraWordmark({super.key, this.onDark = false, this.compact = false});

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
           onDark:
               backgroundColor == Nura.forest ||
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
    final useDarkMark =
        onDark || Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        NuraWordmark(onDark: useDarkMark, compact: true),
        if (pageTitle != null) ...[
          Container(
            width: 1,
            height: 22,
            margin: const EdgeInsets.symmetric(horizontal: 11),
            color: useDarkMark
                ? Colors.white24
                : Theme.of(context).dividerColor,
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
