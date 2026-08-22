import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/tokens.dart';
import '../../ui/mascot/nura_companion.dart';

class NewOnboarding extends StatefulWidget {
  const NewOnboarding({super.key});
  @override
  State<NewOnboarding> createState() => _NewOnboardingState();
}

class _NewOnboardingState extends State<NewOnboarding> {
  int step = 0;
  String lang = 'ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (step == 0) ...[
                const NuraCompanion(message: 'Merhaba, ben Nura. Sıfırdan öğreteceğim.'),
                const SizedBox(height: 24),
                Text('Hangi dili öğrenmek istiyorsun?', style: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.w800)),
                const SizedBox(height: 16),
                for (final e in {'ar': 'Arapça', 'ru': 'Rusça', 'ja': 'Japonca', 'ko': 'Korece'}.entries)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: OutlinedButton(
                      onPressed: () => setState(() {
                        lang = e.key;
                        step = 1;
                      }),
                      child: Text(e.value),
                    ),
                  ),
              ] else if (step == 1) ...[
                const NuraCompanion(message: 'Alfabeyi bilmeden kelimeye geçmeyiz.', state: MascotState.thinking),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => setState(() => step = 2),
                  child: const Text('Sıfırdan başlıyorum'),
                ),
                OutlinedButton(
                  onPressed: () => setState(() => step = 2),
                  child: const Text('Biraz biliyorum'),
                ),
              ] else ...[
                const NuraCompanion(message: 'Yol haritan hazır. İlerlemen kaybolmasın.', state: MascotState.encourage),
                const Spacer(),
                ElevatedButton(onPressed: () => context.go('/login'), child: const Text('Kayıt ol')),
                OutlinedButton(onPressed: () => context.go('/alphabet/$lang'), child: const Text('Önce 2 dakika bak')),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
