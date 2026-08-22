import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/tokens.dart';

enum MascotState { happy, celebration, thinking, encourage, sleeping }

class NuraCompanion extends StatelessWidget {
  final String message;
  final MascotState state;

  /// Sıkışık mod: alt navigasyon üstü gibi dar alanlar için.
  final bool compact;
  const NuraCompanion({
    super.key,
    required this.message,
    this.state = MascotState.happy,
    this.compact = false,
  });

  String get _face => switch (state) {
        MascotState.happy => '🦊',
        MascotState.celebration => '🎉',
        MascotState.thinking => '🤔',
        MascotState.encourage => '💪',
        MascotState.sleeping => '💤',
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: compact ? const EdgeInsets.fromLTRB(12, 6, 12, 6) : const EdgeInsets.all(16),
      padding: compact ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8) : const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: NuraTokens.accent.withValues(alpha: compact ? 0.07 : 0.10),
        borderRadius: BorderRadius.circular(compact ? 14 : 20),
        border: Border.all(color: NuraTokens.accent.withValues(alpha: compact ? 0.4 : 1), width: compact ? 1.5 : 2),
      ),
      child: Row(
        children: [
          Text(_face, style: TextStyle(fontSize: compact ? 26 : 40)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nura',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w900,
                    color: NuraTokens.accent,
                    fontSize: compact ? 12 : 14,
                  ),
                ),
                Text(
                  message,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700,
                    fontSize: compact ? 13 : 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
