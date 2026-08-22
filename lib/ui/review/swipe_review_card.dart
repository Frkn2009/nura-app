import 'package:flutter/material.dart';

/// Tinder tarzı kaydırılabilir tekrar kartı.
///
/// Sağa kaydır = "iyi/kolay", sola kaydır = "tekrar". Klasik 4 buton yerine
/// dokunsal, hızlı bir değerlendirme akışı sağlar. Renkler temadan gelir
/// (sözleşme: hardcoded renk yasak).
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

class _SwipeReviewCardState extends State<SwipeReviewCard>
    with SingleTickerProviderStateMixin {
  Offset _offset = Offset.zero;
  double _rotation = 0.0;

  static const double _threshold = 100.0;
  static const double _maxRotation = 0.15;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _offset += details.delta;
      _rotation = (_offset.dx / 1000).clamp(-_maxRotation, _maxRotation).toDouble();
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_offset.dx > _threshold) {
      widget.onSwipedRight();
    } else if (_offset.dx < -_threshold) {
      widget.onSwipedLeft();
    }
    setState(() {
      _offset = Offset.zero;
      _rotation = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final background = _offset.dx > 20
        ? scheme.tertiaryContainer
        : _offset.dx < -20
            ? scheme.errorContainer
            : Theme.of(context).cardColor;

    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Transform.translate(
        offset: _offset,
        child: Transform.rotate(
          angle: _rotation,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: background,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, 10),
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
