import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/tokens.dart';
import '../../ui/mascot/nura_companion.dart';

/// Plus (Premium) ekranı.
class PlusScreen extends StatelessWidget {
  const PlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nura Plus')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('👑', style: TextStyle(fontSize: 72)),
              const SizedBox(height: 16),
              Text(
                'Nura Plus',
                style: GoogleFonts.nunito(fontSize: 28, fontWeight: FontWeight.w900, color: NuraTokens.goldDark),
              ),
              const SizedBox(height: 8),
              Text(
                'Sınırsız konuşma · Reklamsız · 30 dil · Aile planı',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(fontSize: 14, color: NuraTokens.muted, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: NuraTokens.gold, foregroundColor: NuraTokens.textDark),
                onPressed: () => context.push('/paywall'),
                child: const Text('Plus\'a Geç 👑'),
              ),
              const NuraCompanion(message: 'Plus ile öğrenmenin tadına bak! 🦊', state: MascotState.celebration, compact: true),
            ],
          ),
        ),
      ),
    );
  }
}
