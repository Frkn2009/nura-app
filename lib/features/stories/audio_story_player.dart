import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/tokens.dart';

class StoryChapter {
  final String title;
  final List<StoryWord> words;
  final String? audioUrl; // Gerçek ses dosyası varsa
  StoryChapter({required this.title, required this.words, this.audioUrl});
}

class StoryWord {
  final String text;
  final String translation;
  bool isHighlighted;
  StoryWord({required this.text, required this.translation, this.isHighlighted = false});
}

class AudioStoryPlayer extends StatefulWidget {
  final StoryChapter chapter;
  final String langCode;
  const AudioStoryPlayer({super.key, required this.chapter, required this.langCode});

  @override
  State<AudioStoryPlayer> createState() => _AudioStoryPlayerState();
}

class _AudioStoryPlayerState extends State<AudioStoryPlayer> {
  final FlutterTts _tts = FlutterTts();
  int _currentWordIndex = -1;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _tts.setLanguage(widget.langCode);
    _tts.setSpeechRate(0.4); // Yavaş oku (öğretmen gibi)
    _tts.setPitch(1.1);       // Samimi ses
    _tts.setVolume(1.0);
  }

  Future<void> _playWord(int index) async {
    if (_isPlaying) return;
    setState(() {
      _currentWordIndex = index;
      widget.chapter.words[index].isHighlighted = true;
    });
    await _tts.speak(widget.chapter.words[index].text);
    if (mounted) {
      setState(() {
        _currentWordIndex = -1;
        widget.chapter.words[index].isHighlighted = false;
      });
    }
  }

  Future<void> _playAll() async {
    setState(() => _isPlaying = true);
    for (int i = 0; i < widget.chapter.words.length; i++) {
      await _playWord(i);
      await Future.delayed(const Duration(milliseconds: 200)); // Kelimeler arası durak
    }
    setState(() => _isPlaying = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NuraTokens.bg,
      appBar: AppBar(
        title: Text(widget.chapter.title, style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
        backgroundColor: NuraTokens.bg,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(_isPlaying ? Icons.stop : Icons.play_arrow, color: NuraTokens.primary),
            onPressed: _isPlaying ? () {} : _playAll,
          ),
        ],
      ),
      body: Column(
        children: [
          // İlerleme
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                LinearProgressIndicator(value: (_currentWordIndex + 1) / widget.chapter.words.length, minHeight: 8, borderRadius: BorderRadius.circular(4), backgroundColor: Colors.grey.shade200, valueColor: const AlwaysStoppedAnimation(NuraTokens.primary)),
                const SizedBox(height: 8),
                Text('${_currentWordIndex + 1} / ${widget.chapter.words.length} kelime', style: GoogleFonts.nunito(color: Colors.grey, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          // Hikaye kartı
          Expanded(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 8, runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: widget.chapter.words.asMap().entries.map((entry) {
                      final idx = entry.key;
                      final word = entry.value;
                      final isActive = idx == _currentWordIndex;
                      return GestureDetector(
                        onTap: () => _playWord(idx),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isActive ? NuraTokens.primary : word.isHighlighted ? NuraTokens.accent.withOpacity(0.1) : NuraTokens.surface,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: isActive ? [BoxShadow(color: NuraTokens.primary.withOpacity(0.4), blurRadius: 12, spreadRadius: 2)] : [],
                          ),
                          child: Column(
                            children: [
                              Text(word.text, style: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.w800, color: isActive ? Colors.white : NuraTokens.textDark)),
                              if (isActive) Text(word.translation, style: GoogleFonts.nunito(fontSize: 12, color: Colors.white70)),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
