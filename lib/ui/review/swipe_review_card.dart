import 'package:flutter/material.dart';

/// Tinder tarzı kaydırmalı review kartı
/// Sağa kaydır = Biliyorum (Good/Easy)
/// Sola kaydır = Bilmiyorum (Again)
class SwipeReviewCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onSwipedRight;
  final VoidCallback onSwipedLeft;

  const SwipeReviewCard({
    super.key,
    required this.child,
    required this.onSwipedRight,
    required this.onSwipedLeft,
  });

  @override
  State<SwipeReviewCard> createState() => _SwipeReviewCardState();
}

class _SwipeReviewCardState extends State<SwipeReviewCard>
    with SingleTickerProviderStateMixin {
  Offset _offset = Offset.zero;
  double _rotation = 0.0;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _offset += details.delta;
      _rotation = (_offset.dx / 1000).clamp(-0.15, 0.15);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    const double threshold = 100.0;
    if (_offset.dx > threshold) {
      widget.onSwipedRight();
    } else if (_offset.dx < -threshold) {
      widget.onSwipedLeft();
    }
    setState(() {
      _offset = Offset.zero;
      _rotation = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    if (_offset.dx > 20) {
      bgColor = Colors.green.shade50;
    } else if (_offset.dx < -20) {
      bgColor = Colors.red.shade50;
    } else {
      bgColor = Theme.of(context).cardColor;
    }

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
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
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
