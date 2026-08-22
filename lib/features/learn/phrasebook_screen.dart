import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/tokens.dart';
import '../../ui/mascot/nura_companion.dart';

/// Mini sözlük / kalıp cümle kitapçığı.
/// Dolu içerik bir sonraki pakette geliyor.
class PhrasebookScreen extends StatelessWidget {
  const PhrasebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalıp Cümleler')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('📖', style: TextStyle(fontSize: 64)),
              const SizedBox(height: 16),
              Text(
                'Kalıp cümle kitapçığı hazırlanıyor!',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w900, color: NuraTokens.textDark),
              ),
              const SizedBox(height: 8),
              Text(
                'Binlerce kalıp cümle, seslendirmesiyle burada olacak.',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(fontSize: 14, color: NuraTokens.muted, fontWeight: FontWeight.w600),
              ),
              const NuraCompanion(message: 'Kısa süre sonra buradayım, söz! 🦊', state: MascotState.encourage, compact: true),
            ],
          ),
        ),
      ),
    );
  }
}
