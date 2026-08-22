import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/tokens.dart';

enum MascotMood { happy, celebrate, think, encourage, sleep, speak }

class NuraMascot extends StatelessWidget {
  final String message;
  final MascotMood mood;
  final VoidCallback? onTap;
  const NuraMascot({super.key, required this.message, this.mood = MascotMood.happy, this.onTap});

  String get _lottiePath => switch (mood) {
    MascotMood.happy => 'assets/mascot/fox_happy.json',
    MascotMood.celebrate => 'assets/mascot/fox_jump.json',
    MascotMood.think => 'assets/mascot/fox_think.json',
    MascotMood.encourage => 'assets/mascot/fox_point.json',
    MascotMood.sleep => 'assets/mascot/fox_sleep.json',
    MascotMood.speak => 'assets/mascot/fox_speak.json',
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: NuraTokens.accent.withOpacity(0.08), borderRadius: BorderRadius.circular(24), border: Border.all(color: NuraTokens.accent.withOpacity(0.3), width: 2)),
        child: Row(
          children: [
            // Lottie animasyon (Dosya yoksa emoji fallback)
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(22), bottomLeft: Radius.circular(22)),
              child: SizedBox(
                width: 80, height: 80,
                child: Lottie.asset(_lottiePath, repeat: true, animate: true, errorBuilder: (_, __, ___) => const Center(child: Text('🦊', style: TextStyle(fontSize: 48)))),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text('NURA', style: GoogleFonts.nunito(fontWeight: FontWeight.w900, color: NuraTokens.accent, fontSize: 12)),
                        const SizedBox(width: 8),
                        Container(
                          width: 8, height: 8,
                          decoration: BoxDecoration(color: NuraTokens.primary, shape: BoxShape.circle),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(message, style: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 15, color: NuraTokens.textDark, height: 1.3)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
