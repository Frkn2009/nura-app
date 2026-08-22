import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/tokens.dart';
import '../../features/plus/domain/entitlement.dart';
import '../../features/plus/state/plus_controller.dart';
import '../../state/session.dart';
import '../../ui/mascot/nura_companion.dart';

/// Günlük çark — kullanıcıyı özel hissettiren ödül deneyimi.
/// Kural: günde 1 kez (Plus 2 kez), reklam izleyerek +1 hak.
class DailyWheelScreen extends ConsumerStatefulWidget {
  const DailyWheelScreen({super.key});
  @override
  ConsumerState<DailyWheelScreen> createState() => _DailyWheelScreenState();
}

class _Segment {
  final String title;
  final Color color;
  final String icon;
  const _Segment(this.title, this.color, this.icon);
}

class _DailyWheelScreenState extends ConsumerState<DailyWheelScreen>
    with SingleTickerProviderStateMixin {
  static const _segments = <_Segment>[
    _Segment('+50 XP', Color(0xFF58CC02), '⚡'),
    _Segment('+100 XP', Color(0xFF1CB0F6), '🔥'),
    _Segment('+1 Can', Color(0xFFFF4B4B), '❤️'),
    _Segment('Plus Dene', Color(0xFFFFC800), '👑'),
    _Segment('+10 Elmas', Color(0xFF9B72CF), '💎'),
    _Segment('Gizli Kelime', Color(0xFF2EC4B6), '🎁'),
  ];

  static const _secretWords = <String>[
    'مرحبا — Merhaba (Arapça)',
    'Привет — Merhaba (Rusça)',
    'こんにちは — Merhaba (Japonca)',
    '안녕하세요 — Merhaba (Korece)',
    'Γεια σου — Merhaba (Yunanca)',
    'שלום — Merhaba (İbranice)',
    'नमस्ते — Merhaba (Hintçe)',
    'สวัสดี — Merhaba (Tayca)',
    'Hello — Merhaba (İngilizce)',
    'Hola — Merhaba (İspanyolca)',
  ];

  late final AnimationController _ctrl;
  late Animation<double> _anim;
  bool _spinning = false;
  int _wonIndex = 0;
  int _spinsLeft = 1;
  bool _extraByAd = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    _loadState();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _loadState() async {
    final p = await SharedPreferences.getInstance();
    final today = _dayKey();
    final lastDay = p.getString('wheel_last_day');
    if (lastDay != today) {
      await p.setString('wheel_last_day', today);
      await p.setInt('wheel_spins_today', 0);
    }
    final used = p.getInt('wheel_spins_today') ?? 0;
    final isPlus = _isPlus;
    final extra = p.getBool('wheel_extra_ad') ?? false;
    final maxSpins = (isPlus ? 2 : 1) + (extra ? 1 : 0);
    if (!mounted) return;
    setState(() {
      _spinsLeft = max(0, maxSpins - used);
      _extraByAd = extra;
    });
  }

  bool get _isPlus {
    try {
      return ref.read(plusControllerProvider) == NuraEntitlement.plus;
    } catch (_) {
      return false;
    }
  }

  String _dayKey() {
    final n = DateTime.now();
    return '${n.year}-${n.month}-${n.day}';
  }

  Future<void> _spin() async {
    if (_spinning || _spinsLeft <= 0) return;
    _wonIndex = Random().nextInt(_segments.length);

    setState(() {
      _spinning = true;
      _spinsLeft--;
    });
    final p = await SharedPreferences.getInstance();
    await p.setInt('wheel_spins_today', (p.getInt('wheel_spins_today') ?? 0) + 1);

    final targetAngle = 2 * pi * 8 + (2 * pi * _wonIndex / _segments.length);
    _ctrl.reset();
    _anim = Tween<double>(begin: 0, end: targetAngle).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic),
    );
    await _ctrl.forward();
    if (!mounted) return;
    setState(() => _spinning = false);
    _giveReward();
  }

  Future<void> _giveReward() async {
    final won = _segments[_wonIndex];
    final p = await SharedPreferences.getInstance();

    switch (_wonIndex) {
      case 0: // +50 XP
        await _awardXp(50);
        break;
      case 1: // +100 XP
        await _awardXp(100);
        break;
      case 2: // +1 Can
        await p.setInt('hearts', (p.getInt('hearts') ?? 5) + 1);
        break;
      case 3: // Plus Dene — özel hissettirme
        break;
      case 4: // +10 Elmas
        await p.setInt('diamonds', (p.getInt('diamonds') ?? 0) + 10);
        break;
      case 5: // Gizli Kelime
        break;
    }
    if (!mounted) return;
    _showRewardDialog(won);
  }

  Future<void> _awardXp(int amount) async {
    try {
      await ref.read(sessionProvider.notifier).awardXp(amount, source: 'wheel');
    } catch (_) {
      // Bulut kapalıyken sessizce geç — ödül yine de gösterilir.
    }
  }

  Future<void> _showRewardDialog(_Segment won) async {
    final isPlusSegment = _wonIndex == 3;
    final isSecret = _wonIndex == 5;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => AlertDialog(
        title: Text(
          isPlusSegment ? '👑 Sürpriz!' : '${won.icon} Tebrikler!',
          style: const TextStyle(fontSize: 24),
        ),
        content: Text(
          isPlusSegment
              ? 'Plus denemesi kazandın! Sınırsız konuşma, reklamsız deneyim ve 30 dilde sınırsız öğrenme seni bekliyor.'
              : isSecret
                  ? '🎁 Gizli kelime ödülün:\n${_secretWords[Random().nextInt(_secretWords.length)]}\n\nNura sana bunu öğretecek!'
                  : '${won.title} kazandın!\n\nYarın yine gel, Nura seni bekliyor 💚',
          style: const TextStyle(fontSize: 16, height: 1.4),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          if (isPlusSegment) ...[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: NuraTokens.gold, foregroundColor: NuraTokens.textDark),
              onPressed: () {
                Navigator.pop(c);
                context.push('/paywall');
              },
              child: const Text('Plus\'a Geç 👑'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(c),
              child: const Text('Sonra'),
            ),
          ] else
            ElevatedButton(
              onPressed: () => Navigator.pop(c),
              child: const Text('Topla 🎉'),
            ),
        ],
      ),
    );
  }

  Future<void> _watchAdForExtraSpin() async {
    await context.push('/ad');
    if (!mounted) return;
    final p = await SharedPreferences.getInstance();
    await p.setBool('wheel_extra_ad', true);
    setState(() {
      _extraByAd = true;
      _spinsLeft++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('📺 Reklam izledin, 1 çark hakkı kazandın!'),
        backgroundColor: NuraTokens.gold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPlus = _isPlus;
    return Scaffold(
      backgroundColor: NuraTokens.bg,
      appBar: AppBar(
        title: const Text('🎡 Günlük Çark'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            // Başlık — özel hissettiren
            Text(
              'Bugün sana özel ödülün!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 4),
            Text(
              isPlus ? 'Plus üyesisin: bu ay 2 hakkın var 👑' : 'Her gün 1 hak · reklamla +1',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: NuraTokens.muted, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            // Ok işareti
            const Icon(Icons.arrow_drop_down, size: 52, color: NuraTokens.danger),
            // Çark
            AnimatedBuilder(
              animation: _anim,
              builder: (context, _) {
                return Transform.rotate(
                  angle: _anim.value,
                  child: CustomPaint(
                    size: const Size(300, 300),
                    painter: _WheelPainter(segments: _segments),
                  ),
                );
              },
            ),
            const Spacer(),
            // Çevir butonu
            if (_spinsLeft > 0)
              SizedBox(
                width: 240,
                height: 60,
                child: ElevatedButton(
                  onPressed: _spin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: NuraTokens.gold,
                    foregroundColor: NuraTokens.textDark,
                    elevation: 6,
                    shadowColor: NuraTokens.goldDark.withValues(alpha: 0.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    _spinning ? 'Dönüyor...' : 'ÇEVİR! 🎡',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                ),
              )
            else ...[
              const NuraCompanion(
                message: 'Bugünlük bu kadar! Yarın yine gel, ödülün seni bekliyor 🎡',
                state: MascotState.happy,
              ),
              if (!_extraByAd)
                TextButton.icon(
                  onPressed: _watchAdForExtraSpin,
                  icon: const Icon(Icons.smart_display, color: NuraTokens.gold),
                  label: const Text('📺 Reklam izle, 1 hak daha kazan'),
                ),
            ],
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _WheelPainter extends CustomPainter {
  final List<_Segment> segments;
  _WheelPainter({required this.segments});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final sweep = 2 * pi / segments.length;

    // Dış gölge halkası
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = Colors.black.withValues(alpha: 0.08)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );

    for (int i = 0; i < segments.length; i++) {
      final start = i * sweep - pi / 2;
      final paint = Paint()
        ..shader = LinearGradient(
          colors: [segments[i].color, Color.lerp(segments[i].color, Colors.black, 0.15)!],
        ).createShader(Rect.fromCircle(center: center, radius: radius));
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), start, sweep, true, paint);

      // Segment çizgisi
      canvas.drawLine(
        center,
        center + Offset.fromDirection(start, radius),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 3,
      );

      // İkon
      final iconPos = center + Offset.fromDirection(start + sweep / 2, radius * 0.72);
      final tp = TextPainter(
        text: TextSpan(text: segments[i].icon, style: const TextStyle(fontSize: 24)),
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, iconPos - Offset(tp.width / 2, tp.height / 2));

      // Başlık
      final tp2 = TextPainter(
        text: TextSpan(
          text: segments[i].title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 13, shadows: [Shadow(color: Colors.black45, blurRadius: 4)]),
        ),
        textDirection: TextDirection.ltr,
      );
      tp2.layout();
      final textPos = center + Offset.fromDirection(start + sweep / 2, radius * 0.45);
      tp2.paint(canvas, textPos - Offset(tp2.width / 2, tp2.height / 2));
    }

    // Merkez daire — logo
    canvas.drawCircle(center, 26, Paint()..color = Colors.white);
    canvas.drawCircle(center, 22, Paint()..color = NuraTokens.textDark);
    final logo = TextPainter(
      text: const TextSpan(text: 'N', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 22)),
      textDirection: TextDirection.ltr,
    );
    logo.layout();
    logo.paint(canvas, center - Offset(logo.width / 2, logo.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
