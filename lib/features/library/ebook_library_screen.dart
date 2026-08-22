import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/tokens.dart';
import '../stories/audio_story_player.dart';

class Book {
  final String id;
  final String title;
  final String coverUrl;
  final String langCode;
  final int level;
  final String description;
  final List<StoryChapter> chapters;
  final int readCount;
  Book({required this.id, required this.title, required this.coverUrl, required this.langCode, required this.level, required this.description, required this.chapters, this.readCount = 0});
}

class EbookLibraryScreen extends StatelessWidget {
  const EbookLibraryScreen({super.key});

  // Mock kitaplar - Gerçek veri Supabase'den gelecek
  final _books = [
    Book(
      id: '1',
      title: 'İlk Adımlarım',
      coverUrl: 'https://placeholder.com/book1.jpg',
      langCode: 'tr',
      level: 1,
      description: 'Çocuklar için basit cümlelerle dolu macera dolu bir hikaye.',
      chapters: [
        StoryChapter(title: 'Bölüm 1: Sabah', words: [StoryWord(text: 'Merhaba', translation: 'Hello'), StoryWord(text: 'Dünya', translation: 'World')]),
      ],
    ),
    Book(
      id: '2',
      title: 'Restoranda',
      coverUrl: 'https://placeholder.com/book2.jpg',
      langCode: 'tr',
      level: 2,
      description: 'Restoranda yemek sipariş etmeyi öğren.',
      chapters: [
        StoryChapter(title: 'Sipariş', words: [StoryWord(text: 'Bir', translation: 'One'), StoryWord(text: 'kahve', translation: 'coffee')]),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NuraTokens.bg,
      appBar: AppBar(
        title: Text('📚 E-Kitap Kütüphanesi', style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
        backgroundColor: NuraTokens.bg, elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.65, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemCount: _books.length,
        itemBuilder: (context, index) {
          final book = _books[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AudioStoryPlayer(chapter: book.chapters.first, langCode: book.langCode))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      color: NuraTokens.accent.withOpacity(0.1),
                      child: Center(child: Text(book.title[0], style: GoogleFonts.nunito(fontSize: 48, fontWeight: FontWeight.w900, color: NuraTokens.accent))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(book.title, style: GoogleFonts.nunito(fontWeight: FontWeight.w800, fontSize: 14, color: NuraTokens.textDark), maxLines: 1, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(color: NuraTokens.gold, borderRadius: BorderRadius.circular(4)),
                              child: Text('Seviye ${book.level}', style: GoogleFonts.nunito(fontWeight: FontWeight.w800, fontSize: 10, color: Colors.white)),
                            ),
                            const Spacer(),
                            Icon(Icons.headphones, size: 16, color: Colors.grey.shade600),
                            const SizedBox(width: 4),
                            Text('${book.readCount}', style: GoogleFonts.nunito(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
