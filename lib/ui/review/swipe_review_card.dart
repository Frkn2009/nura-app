import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/tokens.dart';

/// Tinder tarzı kaydırma ile kart değerlendirme (Contract madde 7).
///
/// Klasik 4 buton YASAK: sağa kaydır = "hatırladım" (good),
/// sola kaydır = "tekrar" (again). Cevabın ne kadar sürede verildiği
/// CognitiveTracker tarafından ayrıca ölçülür.
class SwipeReviewCard extends StatefulWidget {
  const SwipeReviewCard({
    super.key,
    required this.child,
    required this.onSwipedRight,
    required this.onSwipedLeft,
  });

  final Widget child;
  final VoidCallback onSwipedRight;
  final VoidCallback onSwipedLeft;

  @override
  State<SwipeReviewCard> createState() => _SwipeReviewCardState();
}

class _SwipeReviewCardState extends State<SwipeReviewCard> {
  static const double _threshold = 100.0;

  Offset _offset = Offset.zero;
  double _rotation = 0.0;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _offset += details.delta;
      _rotation = (_offset.dx / 1000).clamp(-0.15, 0.15);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final committedRight = _offset.dx > _threshold;
    final committedLeft = _offset.dx < -_threshold;
    setState(() {
      _offset = Offset.zero;
      _rotation = 0.0;
    });
    if (committedRight) {
      HapticFeedback.mediumImpact();
      widget.onSwipedRight();
    } else if (committedLeft) {
      HapticFeedback.mediumImpact();
      widget.onSwipedLeft();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Kaydırma yönüne göre token tabanlı renk geçişi (hardcode renk YASAK).
    final t = (_offset.dx.abs() / _threshold).clamp(0.0, 1.0);
    final tint = _offset.dx >= 0 ? Nura.mintLight : Nura.peach;
    final background =
        Color.lerp(Theme.of(context).cardColor, tint, t * 0.85) ??
            Theme.of(context).cardColor;

    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Transform.translate(
        offset: _offset,
        child: Transform.rotate(
          angle: _rotation,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Nura.radiusLg),
              color: background,
              border: Border.all(color: t > 0 ? tint : Nura.fog, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1A000000),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
