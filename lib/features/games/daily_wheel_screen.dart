import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/tokens.dart';
import '../../state/session.dart';

class DailyWheelScreen extends ConsumerStatefulWidget {
  const DailyWheelScreen({super.key});
  @override
  ConsumerState<DailyWheelScreen> createState() => _DailyWheelScreenState();
}

class _WheelPrize {
  const _WheelPrize({
    required this.title,
    required this.color,
    required this.icon,
    this.xp = 0,
  });
  final String title;
  final Color color;
  final String icon;
  final int xp;
}

class _DailyWheelScreenState extends ConsumerState<DailyWheelScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _spinning = false;
  bool _done = false;
  int _wonIndex = 0;

  static const _segments = [
    _WheelPrize(title: '+20 XP', color: VoxeloTokens.accent, icon: '⚡', xp: 20),
    _WheelPrize(title: '+40 XP', color: VoxeloTokens.primary, icon: '🔥', xp: 40),
    _WheelPrize(title: '+30 XP', color: VoxeloTokens.purple, icon: '💎', xp: 30),
    _WheelPrize(title: 'Plus Dene', color: VoxeloTokens.gold, icon: '👑'),
    _WheelPrize(title: '+60 XP', color: Colors.teal, icon: '🎁', xp: 60),
    _WheelPrize(title: '+25 XP', color: VoxeloTokens.danger, icon: '✨', xp: 25),
  ];

  String get _todayKey {
    final n = DateTime.now().toUtc();
    return '${n.year}-${n.month}-${n.day}';
  }

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    _loadState();
  }

  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() => _done = prefs.getString('wheel_day') == _todayKey);
  }

  Future<void> _spin() async {
    if (_spinning || _done) return;
    _wonIndex = Random().nextInt(_segments.length);
    final targetAngle = 2 * pi * 8 + (2 * pi * _wonIndex / _segments.length);

    setState(() => _spinning = true);
    _ctrl.reset();
    _anim = Tween<double>(
      begin: 0,
      end: targetAngle,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    await _ctrl.forward();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('wheel_day', _todayKey);

    final prize = _segments[_wonIndex];
    var awarded = 0;
    if (prize.xp > 0) {
      awarded = await ref
          .read(sessionProvider.notifier)
          .awardXp(prize.xp, source: 'wheel');
    }

    if (!mounted) return;
    setState(() {
      _spinning = false;
      _done = true;
    });
    _showReward(prize, awarded);
  }

  void _showReward(_WheelPrize prize, int awarded) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(
          '${prize.icon} Tebrikler!',
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
        content: Text(
          prize.xp > 0
              ? '$awarded XP hesabına eklendi!'
              : 'Plus ile sınırsız konuşma ve reklamsız deneyimi keşfet.',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          if (prize.xp == 0)
            TextButton(
              onPressed: () {
                Navigator.pop(c);
                Navigator.pop(context);
              },
              child: const Text('Belki sonra'),
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(c);
              if (prize.xp == 0) {
                context.push('/paywall');
              } else {
                Navigator.pop(context);
              }
            },
            child: Text(prize.xp == 0 ? 'Plus\'a geç' : 'Topla'),
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
      backgroundColor: VoxeloTokens.background,
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
                color: VoxeloTokens.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            const Icon(
              Icons.arrow_drop_down,
              size: 48,
              color: VoxeloTokens.danger,
            ),
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
                  backgroundColor: VoxeloTokens.gold,
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
                    color: VoxeloTokens.textPrimary,
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
  final List<_WheelPrize> segments;
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
        Paint()..color = segments[i].color,
      );

      canvas.drawLine(
        center,
        center + Offset.fromDirection(start, radius),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2,
      );

      final tp = TextPainter(
        text: TextSpan(
          text: segments[i].title,
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

    canvas.drawCircle(center, 20, Paint()..color = Colors.white);
    canvas.drawCircle(center, 18, Paint()..color = VoxeloTokens.textPrimary);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
