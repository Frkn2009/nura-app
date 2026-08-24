import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';

/// Tek bir tanıtım turu adımı: gerçek bir ekran öğesine (GlobalKey ile)
/// bağlı bir spot ışığı + başlık/açıklama balonu.
class CoachStep {
  const CoachStep({
    required this.targetKey,
    required this.title,
    required this.body,
  });
  final GlobalKey targetKey;
  final String title;
  final String body;
}

/// Gerçek ekranlar üzerinde çalışan, arka planı karartıp hedef widget'ın
/// etrafına spot ışığı düşüren interaktif tanıtım turu. Uygulama içindeki
/// gerçek widget ağacına bağlıdır (mockup ekran değil) — [CoachStep.targetKey]
/// hangi widget'ı işaret edeceğini belirtir.
class CoachTour {
  static OverlayEntry? _entry;

  static void start(
    BuildContext context, {
    required List<CoachStep> steps,
    VoidCallback? onFinish,
  }) {
    if (steps.isEmpty) return;
    dismiss();
    final overlay = Overlay.of(context, rootOverlay: true);
    _entry = OverlayEntry(
      builder: (_) => _CoachTourOverlay(
        steps: steps,
        onFinish: () {
          dismiss();
          onFinish?.call();
        },
      ),
    );
    overlay.insert(_entry!);
  }

  static void dismiss() {
    _entry?.remove();
    _entry = null;
  }
}

class _CoachTourOverlay extends StatefulWidget {
  const _CoachTourOverlay({required this.steps, required this.onFinish});
  final List<CoachStep> steps;
  final VoidCallback onFinish;

  @override
  State<_CoachTourOverlay> createState() => _CoachTourOverlayState();
}

class _CoachTourOverlayState extends State<_CoachTourOverlay> {
  int _index = 0;

  void _next() {
    if (_index >= widget.steps.length - 1) {
      widget.onFinish();
    } else {
      setState(() => _index++);
    }
  }

  Rect? _targetRect() {
    final ctx = widget.steps[_index].targetKey.currentContext;
    final box = ctx?.findRenderObject() as RenderBox?;
    if (box == null || !box.attached) return null;
    return (box.localToGlobal(Offset.zero) & box.size).inflate(8);
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.steps[_index];
    final rect = _targetRect();
    final screen = MediaQuery.of(context).size;

    if (rect == null) {
      // Hedef şu an ekranda değil (örn. henüz layout olmadı veya
      // kaydırılmış) — bir sonraki adıma geç, kullanıcıyı bekletme.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _next();
      });
      return const SizedBox.shrink();
    }

    final showBelow = rect.center.dy < screen.height / 2;

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: _next,
            child: CustomPaint(
              painter: _SpotlightPainter(rect: rect),
              size: Size.infinite,
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          top: showBelow ? rect.bottom + 16 : null,
          bottom: showBelow ? null : screen.height - rect.top + 16,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Nura.forest,
                borderRadius: BorderRadius.circular(Nura.radiusLg),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .35),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          step.title,
                          style: const TextStyle(
                            color: Nura.cream,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Text(
                        '${_index + 1}/${widget.steps.length}',
                        style: const TextStyle(
                          color: Nura.terrSoft,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    step.body,
                    style: const TextStyle(
                      color: Color(0xFFB8C8C0),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: widget.onFinish,
                        child: const Text(
                          'Geç',
                          style: TextStyle(color: Nura.terrSoft),
                        ),
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Nura.terr,
                          foregroundColor: Nura.cream,
                        ),
                        onPressed: _next,
                        child: Text(
                          _index >= widget.steps.length - 1 ? 'Bitir' : 'İleri',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  _SpotlightPainter({required this.rect});
  final Rect rect;

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final holePath = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(16)));
    final combined = Path.combine(
      PathOperation.difference,
      overlayPath,
      holePath,
    );
    canvas.drawPath(
      combined,
      Paint()..color = Colors.black.withValues(alpha: .65),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(16)),
      Paint()
        ..color = Nura.terr
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(covariant _SpotlightPainter oldDelegate) =>
      oldDelegate.rect != rect;
}
