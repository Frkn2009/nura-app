import 'package:flutter/material.dart';

/// Voxelo'nun kendi çizgi ikon seti — Material ikon fontu yerine, marka
/// önizlemesinde onaylanan modern/temiz görünümü birebir vermek için
/// Canvas üzerine elle çizilir (VoxeloMascot'un yaptığı gibi, harici asset
/// veya paket yok).
enum VoxeloIcon {
  fire,
  medal,
  book,
  bell,
  globe,
  card,
  logout,
  family,
  cloud,
  leaderboard,
  guide,
  chat,
  replay,
}

class VoxeloLineIcon extends StatelessWidget {
  const VoxeloLineIcon(this.icon, {super.key, this.size = 20, this.color});
  final VoxeloIcon icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size.square(size),
    painter: _VoxeloIconPainter(
      icon,
      color ?? IconTheme.of(context).color ?? Colors.white,
    ),
  );
}

class _VoxeloIconPainter extends CustomPainter {
  const _VoxeloIconPainter(this.icon, this.color);
  final VoxeloIcon icon;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 24, size.height / 24);
    final fill = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    switch (icon) {
      case VoxeloIcon.fire:
        final p = Path()
          ..moveTo(12, 2.6)
          ..quadraticBezierTo(18, 9, 13.2, 12.5)
          ..quadraticBezierTo(15.5, 14, 15.5, 16.8)
          ..arcToPoint(
            const Offset(8.5, 16.8),
            radius: const Radius.circular(4.6),
            clockwise: false,
          )
          ..quadraticBezierTo(8.5, 13, 11, 11.2)
          ..quadraticBezierTo(9.8, 12.4, 9.8, 14)
          ..quadraticBezierTo(9.8, 9.5, 12, 2.6)
          ..close();
        canvas.drawPath(p, fill);
      case VoxeloIcon.medal:
        canvas.drawCircle(const Offset(12, 9.2), 5.6, fill);
        final ribbon = Path()
          ..moveTo(8.7, 13.6)
          ..lineTo(6.6, 21.2)
          ..lineTo(12, 18.2)
          ..lineTo(17.4, 21.2)
          ..lineTo(15.3, 13.6)
          ..close();
        canvas.drawPath(ribbon, fill);
        canvas.drawCircle(
          const Offset(12, 9.2),
          2.6,
          Paint()..color = color.withValues(alpha: 0.35),
        );
      case VoxeloIcon.book:
        final rr = RRect.fromRectAndRadius(
          const Rect.fromLTWH(3.5, 4, 17, 16),
          const Radius.circular(2.4),
        );
        canvas.drawRRect(rr, stroke);
        canvas.drawLine(const Offset(12, 4.6), const Offset(12, 19.4), stroke);
        canvas.drawLine(
          const Offset(6.2, 8.4),
          const Offset(10.2, 8.4),
          stroke,
        );
        canvas.drawLine(
          const Offset(13.8, 8.4),
          const Offset(17.8, 8.4),
          stroke,
        );
        canvas.drawLine(
          const Offset(6.2, 11.6),
          const Offset(10.2, 11.6),
          stroke,
        );
        canvas.drawLine(
          const Offset(13.8, 11.6),
          const Offset(17.8, 11.6),
          stroke,
        );
      case VoxeloIcon.bell:
        final p = Path()
          ..moveTo(6, 10.5)
          ..arcToPoint(
            const Offset(18, 10.5),
            radius: const Radius.circular(6),
            clockwise: true,
          )
          ..cubicTo(18, 15, 20, 16.3, 20, 16.3)
          ..lineTo(4, 16.3)
          ..cubicTo(4, 16.3, 6, 15, 6, 10.5)
          ..close();
        canvas.drawPath(p, fill);
        canvas.drawArc(
          const Rect.fromLTWH(9.5, 17, 5, 4),
          0,
          3.14159,
          false,
          stroke,
        );
      case VoxeloIcon.globe:
        canvas.drawCircle(const Offset(12, 12), 9, stroke);
        canvas.drawOval(
          Rect.fromCenter(center: const Offset(12, 12), width: 8, height: 18),
          stroke,
        );
        canvas.drawLine(const Offset(3, 12), const Offset(21, 12), stroke);
      case VoxeloIcon.card:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTWH(3, 6, 18, 13),
            const Radius.circular(2.4),
          ),
          stroke,
        );
        canvas.drawRect(const Rect.fromLTWH(3, 9.5, 18, 3.2), fill);
      case VoxeloIcon.logout:
        canvas.drawPath(
          Path()
            ..moveTo(14.5, 4.5)
            ..lineTo(10, 4.5)
            ..arcToPoint(const Offset(8, 6.5), radius: const Radius.circular(2))
            ..lineTo(8, 17.5)
            ..arcToPoint(
              const Offset(10, 19.5),
              radius: const Radius.circular(2),
            )
            ..lineTo(14.5, 19.5),
          stroke,
        );
        canvas.drawLine(const Offset(9.5, 12), const Offset(19.5, 12), stroke);
        canvas.drawPath(
          Path()
            ..moveTo(16, 8.3)
            ..lineTo(19.7, 12)
            ..lineTo(16, 15.7),
          stroke,
        );
      case VoxeloIcon.family:
        canvas.drawCircle(const Offset(8.5, 7.5), 3.1, fill);
        canvas.drawCircle(const Offset(16, 8), 2.6, fill);
        canvas.drawPath(
          Path()
            ..moveTo(3.2, 20.2)
            ..cubicTo(3.2, 15.2, 12.6, 15.2, 12.8, 20.2)
            ..close(),
          fill,
        );
        canvas.drawPath(
          Path()
            ..moveTo(13.6, 20.2)
            ..cubicTo(13.6, 16.2, 20.8, 16.2, 20.8, 20.2)
            ..close(),
          Paint()..color = color.withValues(alpha: 0.7),
        );
      case VoxeloIcon.cloud:
        canvas.drawPath(
          Path()
            ..moveTo(6.5, 18)
            ..cubicTo(3.5, 18, 3, 13.6, 6.3, 13.1)
            ..cubicTo(6.3, 9, 12.6, 8.4, 13.8, 12.1)
            ..cubicTo(18.2, 11.6, 19, 15.6, 16.7, 16.6)
            ..cubicTo(18.6, 17, 18.3, 18, 17, 18)
            ..close(),
          fill,
        );
      case VoxeloIcon.leaderboard:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTWH(3.5, 14, 5, 7),
            const Radius.circular(1.4),
          ),
          fill,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTWH(9.5, 8, 5, 13),
            const Radius.circular(1.4),
          ),
          fill,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTWH(15.5, 3.5, 5, 17.5),
            const Radius.circular(1.4),
          ),
          fill,
        );
      case VoxeloIcon.guide:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTWH(3.5, 5, 12, 2.6),
            const Radius.circular(1.3),
          ),
          fill,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTWH(3.5, 10.7, 17, 2.6),
            const Radius.circular(1.3),
          ),
          fill,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTWH(3.5, 16.4, 9, 2.6),
            const Radius.circular(1.3),
          ),
          fill,
        );
      case VoxeloIcon.chat:
        canvas.drawPath(
          Path()
            ..moveTo(4.5, 6.5)
            ..arcToPoint(
              const Offset(6.5, 4.5),
              radius: const Radius.circular(2),
            )
            ..lineTo(17.5, 4.5)
            ..arcToPoint(
              const Offset(19.5, 6.5),
              radius: const Radius.circular(2),
            )
            ..lineTo(19.5, 13.5)
            ..arcToPoint(
              const Offset(17.5, 15.5),
              radius: const Radius.circular(2),
            )
            ..lineTo(10, 15.5)
            ..lineTo(6.5, 19)
            ..lineTo(6.5, 15.5)
            ..arcToPoint(
              const Offset(4.5, 13.5),
              radius: const Radius.circular(2),
            )
            ..close(),
          fill,
        );
      case VoxeloIcon.replay:
        canvas.drawArc(
          const Rect.fromLTWH(3.5, 3.5, 17, 17),
          0.6,
          4.9,
          false,
          stroke,
        );
        canvas.drawPath(
          Path()
            ..moveTo(16.2, 3.2)
            ..lineTo(20.4, 4.2)
            ..lineTo(19.2, 8.3)
            ..close(),
          fill,
        );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _VoxeloIconPainter oldDelegate) =>
      oldDelegate.icon != icon || oldDelegate.color != color;
}
