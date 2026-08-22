import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/tokens.dart';
import '../../ui/mascot/nura_companion.dart';

/// Test / quiz ekranı.
/// Gerçek quiz motoru bir sonraki pakette geliyor;
/// şimdilik mevcut tekrar (review) ekranına köprü.
class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🧠', style: TextStyle(fontSize: 64)),
              const SizedBox(height: 16),
              Text(
                'Test modülü hazırlanıyor!',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w900, color: NuraTokens.textDark),
              ),
              const SizedBox(height: 8),
              Text(
                'Şimdilik kaydırmalı tekrar ile pratik yapabilirsin.',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(fontSize: 14, color: NuraTokens.muted, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.push('/review'),
                child: const Text('Tekrara Git 🔁'),
              ),
              const NuraCompanion(message: 'Soruları senin için hazırlıyorum! 🦊', state: MascotState.thinking, compact: true),
            ],
          ),
        ),
      ),
    );
  }
}
