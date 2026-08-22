import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'story_catalog.dart';

class EbookLibraryScreen extends StatelessWidget {
  const EbookLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini kitaplar')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final s in stories)
            Card(
              child: ListTile(
                title: Text(s.title, style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
                subtitle: Text('Seviye ${s.level} · ${s.lang}'),
                trailing: const Icon(Icons.menu_book),
                onTap: () => context.push('/story/${s.id}'),
              ),
            ),
        ],
      ),
    );
  }
}
