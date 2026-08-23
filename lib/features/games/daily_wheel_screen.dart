import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/theme/tokens.dart';

class DailyWheelScreen extends StatefulWidget {
  const DailyWheelScreen({super.key});
  @override
  State<DailyWheelScreen> createState() => _DailyWheelScreenState();
}

class _DailyWheelScreenState extends State<DailyWheelScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _spinning = false;
  bool _done = false;
  int _wonIndex = 0;

  final _segments = [
    {'title': '+50 XP', 'color': NuraTokens.accent, 'icon': '⚡'},
    {'title': '+1 Can', 'color': NuraTokens.danger, 'icon': '❤️'},
    {'title': '2x XP', 'color': NuraTokens.primary, 'icon': '🔥'},
    {'title': 'Plus Dene', 'color': NuraTokens.gold, 'icon': '👑'},
    {'title': '+10 💎', 'color': NuraTokens.purple, 'icon': '💎'},
    {'title': 'Gizli!', 'color': Colors.teal, 'icon': '🎁'},
  ];

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
  }

  void _spin() {
    if (_spinning || _done) return;
    _wonIndex = Random().nextInt(_segments.length);
    final targetAngle = 2 * pi * 8 + (2 * pi * _wonIndex / _segments.length);

    setState(() => _spinning = true);
    _ctrl.reset();
    _anim = Tween<double>(
      begin: 0,
      end: targetAngle,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _ctrl.forward().then((_) {
      setState(() {
        _spinning = false;
        _done = true;
      });
      _showReward();
    });
  }

  void _showReward() {
    final won = _segments[_wonIndex];
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(
          '${won['icon']} Tebrikler!',
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
        content: Text(
          '${won['title']} kazandın!',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(c);
              Navigator.pop(context);
            },
            child: const Text('Topla'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NuraTokens.background,
      appBar: AppBar(
        title: const Text(
          '🎡 Günlük Çark',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Günlük ödülünü al!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: NuraTokens.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            // Ok işareti
            const Icon(
              Icons.arrow_drop_down,
              size: 48,
              color: NuraTokens.danger,
            ),
            // Çark
            AnimatedBuilder(
              animation: _anim,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _anim.value,
                  child: CustomPaint(
                    size: const Size(280, 280),
                    painter: _WheelPainter(segments: _segments),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 220,
              height: 56,
              child: ElevatedButton(
                onPressed: _done ? null : _spin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: NuraTokens.gold,
                ),
                child: Text(
                  _spinning
                      ? 'Dönüyor...'
                      : _done
                      ? 'Yarın tekrar!'
                      : 'ÇEVİR!',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: NuraTokens.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WheelPainter extends CustomPainter {
  final List<Map<String, dynamic>> segments;
  _WheelPainter({required this.segments});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final sweep = 2 * pi / segments.length;

    for (int i = 0; i < segments.length; i++) {
      final start = i * sweep - pi / 2;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        start,
        sweep,
        true,
        Paint()..color = segments[i]['color'] as Color,
      );

      // Segment çizgisi
      canvas.drawLine(
        center,
        center + Offset.fromDirection(start, radius),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2,
      );

      // Metin
      final tp = TextPainter(
        text: TextSpan(
          text: segments[i]['title'] as String,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 13,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      final textPos =
          center + Offset.fromDirection(start + sweep / 2, radius * 0.6);
      tp.paint(canvas, textPos - Offset(tp.width / 2, tp.height / 2));
    }

    // Merkez daire
    canvas.drawCircle(center, 20, Paint()..color = Colors.white);
    canvas.drawCircle(center, 18, Paint()..color = NuraTokens.textPrimary);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
