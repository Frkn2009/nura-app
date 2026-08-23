import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../data/content/library.dart';
import '../../data/models/models.dart';
import '../../data/speech/speech_controller.dart';
import '../../ui/widgets.dart';

class StoryReaderScreen extends StatefulWidget {
  const StoryReaderScreen({super.key, required this.story});
  final LibraryStory story;

  @override
  State<StoryReaderScreen> createState() => _StoryReaderScreenState();
}

class _StoryReaderScreenState extends State<StoryReaderScreen> {
  final _speech = SpeechController();
  int? _playingIndex;
  bool _playingAll = false;

  @override
  void initState() {
    super.initState();
    _speech.warmUp();
  }

  @override
  void dispose() {
    _speech.dispose();
    super.dispose();
  }

  Future<void> _speakOne(int index) async {
    if (_playingAll) return;
    setState(() => _playingIndex = index);
    await _speech.speakTarget(
      widget.story.sentences[index].target,
      widget.story.lang.code,
    );
    // flutter_tts'in tamamlanma bildirimini beklemek yerine ortalama bir
    // okuma süresi kadar bekliyoruz -- SpeechController şu an bir
    // "bitti" callback'i sunmuyor.
    final ms = (widget.story.sentences[index].target.length * 65).clamp(
      900,
      6000,
    );
    await Future.delayed(Duration(milliseconds: ms));
    if (mounted) setState(() => _playingIndex = null);
  }

  Future<void> _playAll() async {
    if (_playingAll) return;
    setState(() => _playingAll = true);
    for (var i = 0; i < widget.story.sentences.length; i++) {
      if (!mounted || !_playingAll) break;
      setState(() => _playingIndex = i);
      await _speech.speakTarget(
        widget.story.sentences[i].target,
        widget.story.lang.code,
      );
      final ms = (widget.story.sentences[i].target.length * 65).clamp(
        900,
        6000,
      );
      await Future.delayed(Duration(milliseconds: ms));
    }
    if (mounted) {
      setState(() {
        _playingAll = false;
        _playingIndex = null;
      });
    }
  }

  void _stopAll() {
    setState(() {
      _playingAll = false;
      _playingIndex = null;
    });
    _speech.stopSpeak();
  }

  @override
  Widget build(BuildContext context) {
    final story = widget.story;
    final rtl = story.lang.isRtl;
    return Scaffold(
      appBar: NuraAppBar(pageTitle: Text(story.titleTr)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 8),
                children: [
                  Directionality(
                    textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
                    child: Text(
                      story.title,
                      textAlign: rtl ? TextAlign.right : TextAlign.left,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${story.level.name.toUpperCase()} · ${story.lang.label(UiLang.tr)}',
                    style: const TextStyle(color: Nura.muted, fontSize: 12),
                  ),
                  const SizedBox(height: 18),
                  for (var i = 0; i < story.sentences.length; i++) ...[
                    _SentenceCard(
                      sentence: story.sentences[i],
                      rtl: rtl,
                      playing: _playingIndex == i,
                      onSpeak: () => _speakOne(i),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 16),
                child: FilledButton.icon(
                  onPressed: _playingAll ? _stopAll : _playAll,
                  icon: Icon(_playingAll ? Icons.stop : Icons.play_arrow),
                  label: Text(_playingAll ? 'Durdur' : 'Tümünü Oynat'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SentenceCard extends StatelessWidget {
  const _SentenceCard({
    required this.sentence,
    required this.rtl,
    required this.playing,
    required this.onSpeak,
  });

  final LibrarySentence sentence;
  final bool rtl;
  final bool playing;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return NuraCard(
      color: playing ? Nura.mintLight : null,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Directionality(
                  textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
                  child: Text(
                    sentence.target,
                    textAlign: rtl ? TextAlign.right : TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  sentence.glossTr,
                  style: const TextStyle(color: Nura.muted, fontSize: 13),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onSpeak,
            icon: Icon(
              playing ? Icons.volume_up : Icons.volume_up_outlined,
              color: playing ? Nura.mintDark : Nura.soft,
            ),
          ),
        ],
      ),
    );
  }
}
