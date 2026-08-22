import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/tokens.dart';
import '../../ui/mascot/nura_companion.dart';

/// Ayarlar ekranı.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.dark_mode, color: NuraTokens.purple),
              title: Text('Karanlık mod', style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (_) {},
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.notifications, color: NuraTokens.accent),
              title: Text('Günlük hatırlatma'),
              subtitle: Text('Her gün 19:00'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.volume_up, color: NuraTokens.primary),
              title: Text('Ses hızı'),
              subtitle: Text('Yavaş (öğretmen modu)'),
            ),
          ),
          const NuraCompanion(message: 'Ayarları dilediğin gibi kur, birlikte öğrenelim! 🦊', compact: true),
        ],
      ),
    );
  }
}
