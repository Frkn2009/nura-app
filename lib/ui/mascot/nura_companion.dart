import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/tokens.dart';

enum MascotState { happy, celebration, thinking, encourage, sleeping }

class NuraCompanion extends StatelessWidget {
  final String message;
  final MascotState state;
  const NuraCompanion({super.key, required this.message, this.state = MascotState.happy});

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
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: NuraTokens.accent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: NuraTokens.accent, width: 2),
      ),
      child: Row(
        children: [
          Text(_face, style: const TextStyle(fontSize: 40)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nura', style: GoogleFonts.nunito(fontWeight: FontWeight.w900, color: NuraTokens.accent)),
                Text(message, style: GoogleFonts.nunito(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
