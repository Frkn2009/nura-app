import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/tokens.dart';
import '../alphabet/alphabet_engine.dart';
import 'story_catalog.dart';

class StoryReaderScreen extends StatefulWidget {
  final String storyId;
  const StoryReaderScreen({super.key, required this.storyId});
  @override
  State<StoryReaderScreen> createState() => _StoryReaderScreenState();
}

class _StoryReaderScreenState extends State<StoryReaderScreen> {
  int _q = 0;

  @override
  Widget build(BuildContext context) {
    final story = stories.firstWhere((s) => s.id == widget.storyId);
    return Scaffold(
      appBar: AppBar(title: Text(story.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final w in story.words)
                  ActionChip(
                    label: Text(w, style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w800)),
                    onPressed: () => AlphabetEngine.speak(w, story.lang),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            Text('Soru ${_q + 1}/3', style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
            Text(story.questions[_q], style: GoogleFonts.nunito(fontSize: 18)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_q < 2) {
                  setState(() => _q = _q + 1);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Hikaye tamam. Rozet ilerledi.'), backgroundColor: NuraTokens.primary),
                  );
                }
              },
              child: Text(_q < 2 ? 'Sonraki soru' : 'Bitir'),
            ),
          ],
        ),
      ),
    );
  }
}
