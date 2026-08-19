import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/content/catalog.dart';
import '../../data/content/language_guides.dart';
import '../../data/models/models.dart';
import '../../data/speech/speech_controller.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class SpeakHubScreen extends ConsumerWidget {
  const SpeakHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final scenes = Catalog.forLang(p.learnLang);
    final remain = p.remainingSpeakSeconds();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text(i18n.speak, style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 6),
          Text(
            p.isPlus ? 'Sınırsız · Maya ile senaryo' : '${i18n.remainingToday}: ${remain}s',
            style: const TextStyle(color: Nura.muted),
          ),
          const SizedBox(height: 16),
          if (!p.isPlus && remain <= 0)
            NuraCard(
              color: Nura.pale,
              onTap: () => context.push('/paywall'),
              child: Text(i18n.plusCta, style: const TextStyle(fontWeight: FontWeight.w600, color: Nura.forest)),
            ),
          const SizedBox(height: 10),
          for (final s in scenes)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: NuraCard(
                onTap: () => context.push('/session?id=${s.id}'),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Nura.forest,
                      child: Text(s.lang.flag(), style: const TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(s.title(p.uiLang), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                          Text('${s.minutes} dk · ${s.cefr.name.toUpperCase()} · ${s.turns.length} tur',
                              style: const TextStyle(color: Nura.muted, fontSize: 13)),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Nura.soft),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

enum _Step { hear, shadow, speak, fix }

class SpeakSessionScreen extends ConsumerStatefulWidget {
  const SpeakSessionScreen({super.key, required this.scenarioId});
  final String scenarioId;

  @override
  ConsumerState<SpeakSessionScreen> createState() => _SpeakSessionScreenState();
}

class _SpeakSessionScreenState extends ConsumerState<SpeakSessionScreen> {
  int turn = 0;
  _Step step = _Step.hear;
  bool holding = false;
  int holdSec = 0;
  Timer? timer;
  int score = 0;
  final speech = SpeechController();
  String heard = '';

  @override
  void initState() {
    super.initState();
    speech.warmUp();
  }

  Scenario get scene => Catalog.byId(widget.scenarioId) ?? Catalog.forLang(LearnLang.en).first;

  SpeakTurn get currentTurn => scene.turns[turn.clamp(0, scene.turns.length - 1)];

  Phrase get currentPhrase => scene.phrases[turn.clamp(0, scene.phrases.length - 1)];

  @override
  void dispose() {
    timer?.cancel();
    speech.dispose();
    super.dispose();
  }

  void _gate() {
    timer?.cancel();
    setState(() => holding = false);
    context.push('/ad');
  }

  void _down() {
    final p = ref.read(sessionProvider);
    if (!p.isPlus && p.remainingSpeakSeconds() <= 0) {
      _gate();
      return;
    }
    setState(() {
      holding = true;
      holdSec = 0;
      heard = '';
    });
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => holdSec++);
      ref.read(sessionProvider.notifier).consumeSpeak(1);
      if (!ref.read(sessionProvider).isPlus && ref.read(sessionProvider).remainingSpeakSeconds() <= 0) {
        _up();
        _gate();
      }
    });
    speech.startListen(
      langCode: scene.lang.code,
      onTick: (_) {},
      onText: (t) => setState(() => heard = t),
    );
  }

  Future<void> _up() async {
    timer?.cancel();
    final text = await speech.stopListen();
    final expected = currentTurn.expected.toLowerCase();
    final got = (text.isEmpty ? heard : text).toLowerCase();
    var s = 62;
    if (got.isNotEmpty) {
      final words = expected.split(RegExp(r'\s+'));
      final hit = words.where((w) => w.length > 2 && got.contains(w)).length;
      s = (70 + (hit * 30 / (words.isEmpty ? 1 : words.length))).round().clamp(55, 98);
    }
    setState(() {
      holding = false;
      score = s;
      step = _Step.fix;
    });
    ref.read(sessionProvider.notifier).learnPhrase(currentPhrase.id);
  }

  void _nextStep() {
    setState(() {
      step = switch (step) {
        _Step.hear => _Step.shadow,
        _Step.shadow => _Step.speak,
        _Step.speak => _Step.fix,
        _Step.fix => _Step.hear,
      };
    });
  }

  void _nextTurn() {
    if (turn < scene.turns.length - 1) {
      setState(() {
        turn++;
        step = _Step.hear;
        score = 0;
      });
    } else {
      context.go('/app');
    }
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final remain = p.remainingSpeakSeconds();
    const labels = {
      _Step.hear: '1  Duy',
      _Step.shadow: '2  Gölgele',
      _Step.speak: '3  Konuş',
      _Step.fix: '4  Düzelt',
    };

    return Scaffold(
      backgroundColor: Nura.forest,
      appBar: AppBar(
        backgroundColor: Nura.forest,
        foregroundColor: Nura.cream,
        title: Text(scene.title(p.uiLang)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 18),
            child: Text(p.isPlus ? '∞' : '${remain}s', style: const TextStyle(color: Nura.terrSoft)),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (final s in _Step.values)
                    Text(
                      labels[s]!,
                      style: TextStyle(
                        color: s == step ? Nura.terrSoft : const Color(0xFF6A8A7E),
                        fontWeight: s == step ? FontWeight.w700 : FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 22),
              const CircleAvatar(
                radius: 40,
                backgroundColor: Nura.cream,
                child: Text('M', style: TextStyle(fontSize: 28, color: Nura.forest, fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 8),
              const Text('Maya', style: TextStyle(color: Nura.terrSoft)),
              const SizedBox(height: 18),
              Text(
                currentTurn.prompt,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFFB8C8C0), fontSize: 15),
              ),
              const SizedBox(height: 12),
              Text(
                currentTurn.expected,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Nura.cream, fontSize: 24, fontWeight: FontWeight.w600, height: 1.3),
              ),
              const SizedBox(height: 8),
              Text(
                currentPhrase.glossFor(p.uiLang),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFFB8C8C0)),
              ),
              if (LanguageGuide.of(scene.lang).tipFor(currentTurn.expected) != null) ...[
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A4A3A),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    () {
                      final tip = LanguageGuide.of(scene.lang).tipFor(currentTurn.expected)!;
                      return '${tip.written}  →  ${tip.heard}\n${tip.example}  ≈  ${tip.exampleSaid}';
                    }(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Nura.terrSoft, height: 1.35, fontSize: 13),
                  ),
                ),
              ],
              const Spacer(),
              if (step == _Step.fix) ...[
                Wrap(
                  spacing: 8,
                  children: [
                    _chip('Telaffuz $score'),
                    _chip('Akıcılık ${score - 8}'),
                    _chip('Netlik ${score + 6}'),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Tek düzeltme: cümleyi yavaş, kelime kelime tekrarla.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFB8C8C0)),
                ),
                const SizedBox(height: 18),
                FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: Nura.terr),
                  onPressed: _nextTurn,
                  child: Text(turn < scene.turns.length - 1 ? i18n.continueCta : 'Bitir'),
                ),
              ] else if (step == _Step.speak) ...[
                GestureDetector(
                  onLongPressStart: (_) => _down(),
                  onLongPressEnd: (_) => _up(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    width: holding ? 96 : 84,
                    height: holding ? 96 : 84,
                    decoration: BoxDecoration(
                      color: Nura.cream,
                      shape: BoxShape.circle,
                      border: Border.all(color: Nura.terr, width: 4),
                      boxShadow: holding ? [BoxShadow(color: Nura.terr.withValues(alpha: 0.45), blurRadius: 24)] : null,
                    ),
                    child: Icon(Icons.mic, color: Nura.terr, size: holding ? 38 : 32),
                  ),
                ),
                const SizedBox(height: 10),
                Text(holding ? '${holdSec}s' : i18n.holdToSpeak, style: const TextStyle(color: Color(0xFFB8C8C0))),
                if (heard.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(heard, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFB8C8C0), fontSize: 13)),
                  ),
              ] else
                FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: Nura.terr),
                  onPressed: () async {
                    if (step == _Step.hear) {
                      await speech.speakTarget(currentTurn.expected, scene.lang.code);
                    }
                    _nextStep();
                  },
                  child: Text(step == _Step.hear ? 'Dinle / duydum' : 'Gölgeledim'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String s) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: const Color(0xFF1A4A3A), borderRadius: BorderRadius.circular(20)),
      child: Text(s, style: const TextStyle(color: Nura.cream, fontSize: 12)),
    );
  }
}
