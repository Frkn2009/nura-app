import 'package:characters/characters.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/tokens.dart';
import 'alphabet_engine.dart';

class LetterPracticeScreen extends StatefulWidget {
  final String langCode;
  final String word;
  const LetterPracticeScreen({super.key, required this.langCode, required this.word});
  @override
  State<LetterPracticeScreen> createState() => _LetterPracticeScreenState();
}

class _LetterPracticeScreenState extends State<LetterPracticeScreen> {
  late List<String> _pool;
  final _built = <String>[];

  @override
  void initState() {
    super.initState();
    _pool = widget.word.characters.toList()..shuffle();
    AlphabetEngine.initTts();
  }

  void _pick(int i) {
    setState(() {
      _built.add(_pool.removeAt(i));
    });
    AlphabetEngine.speak(_built.last, widget.langCode);
    if (_built.join() == widget.word) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Doğru! +10 XP'), backgroundColor: NuraTokens.primary),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Harf birleştir')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text('Hedef', style: GoogleFonts.nunito(color: NuraTokens.muted)),
            Text(widget.word, style: GoogleFonts.nunito(fontSize: 36, fontWeight: FontWeight.w900)),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(_built.join(), style: GoogleFonts.nunito(fontSize: 32, fontWeight: FontWeight.w800)),
            ),
            const Spacer(),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (var i = 0; i < _pool.length; i++)
                  ActionChip(
                    label: Text(_pool[i], style: const TextStyle(fontSize: 22)),
                    onPressed: () => _pick(i),
                  ),
              ],
            ),
            TextButton(
              onPressed: () => setState(() {
                _pool = [..._pool, ..._built]..shuffle();
                _built.clear();
              }),
              child: const Text('Sıfırla'),
            ),
          ],
        ),
      ),
    );
  }
}
