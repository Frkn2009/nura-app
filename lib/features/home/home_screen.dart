import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/tokens.dart';
import '../../ui/mascot/nura_companion.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final hi = hour < 12 ? 'Günaydın' : hour < 18 ? 'İyi günler' : 'İyi akşamlar';
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text('NURA', style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w900, color: NuraTokens.primary)),
            Text('$hi 🌟', style: GoogleFonts.nunito(fontSize: 30, fontWeight: FontWeight.w900)),
            const NuraCompanion(message: 'Önce alfabeyi bitir, sonra çarkı çevir.', state: MascotState.encourage),
            Card(
              child: ListTile(
                leading: const Icon(Icons.local_fire_department, color: NuraTokens.danger, size: 36),
                title: Text('Günlük hedef', style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
                subtitle: const LinearProgressIndicator(value: 0.4, color: NuraTokens.primary),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () => context.push('/path'), child: const Text('Yol haritası')),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: NuraTokens.gold, foregroundColor: NuraTokens.textDark),
              onPressed: () => context.push('/wheel'),
              child: const Text('Günlük çark'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(onPressed: () => context.push('/stories'), child: const Text('Hikayeler')),
            const SizedBox(height: 8),
            OutlinedButton(onPressed: () => context.push('/chest'), child: const Text('Hazine')),
          ],
        ),
      ),
    );
  }
}
