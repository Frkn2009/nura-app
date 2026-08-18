import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/content/catalog.dart';
import '../../data/models/models.dart';
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

class SpeakSessionScreen extends ConsumerStatefulWidget {
  const SpeakSessionScreen({super.key, required this.scenarioId});
  final String scenarioId;

  @override
  ConsumerState<SpeakSessionScreen> createState() => _SpeakSessionScreenState();
}

class _SpeakSessionScreenState extends ConsumerState<SpeakSessionScreen> {
  int turn = 0;
  bool holding = false;
  int holdSec = 0;
  Timer? timer;
  String? lastHeard;
  int score = 0;

  Scenario get scene => Catalog.byId(widget.scenarioId) ?? Catalog.forLang(LearnLang.en).first;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _down() {
    final p = ref.read(sessionProvider);
    if (!p.isPlus && p.remainingSpeakSeconds() <= 0) {
      context.push('/paywall');
      return;
    }
    setState(() {
      holding = true;
      holdSec = 0;
    });
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => holdSec++);
      ref.read(sessionProvider.notifier).consumeSpeak(1);
      if (!ref.read(sessionProvider).isPlus && ref.read(sessionProvider).remainingSpeakSeconds() <= 0) {
        _up();
        context.push('/paywall');
      }
    });
  }

  void _up() {
    timer?.cancel();
    final expected = scene.turns[turn.clamp(0, scene.turns.length - 1)].expected;
    setState(() {
      holding = false;
      lastHeard = expected;
      score = 78 + (expected.length % 17);
    });
    final phrase = scene.phrases[turn.clamp(0, scene.phrases.length - 1)];
    ref.read(sessionProvider.notifier).learnPhrase(phrase.id);
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final t = scene.turns[turn.clamp(0, scene.turns.length - 1)];
    final remain = p.remainingSpeakSeconds();

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
              const CircleAvatar(radius: 48, backgroundColor: Nura.cream, child: Text('M', style: TextStyle(fontSize: 32, color: Nura.forest, fontWeight: FontWeight.w700))),
              const SizedBox(height: 10),
              const Text('Maya · coach', style: TextStyle(color: Nura.terrSoft)),
              const SizedBox(height: 22),
              Text(t.prompt, textAlign: TextAlign.center, style: const TextStyle(color: Nura.cream, fontSize: 18, height: 1.35)),
              const SizedBox(height: 16),
              if (t.scaffold != null)
                Text('İskele: ${t.scaffold}', textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFB8C8C0))),
              const Spacer(),
              if (lastHeard != null) ...[
                Text(lastHeard!, textAlign: TextAlign.center, style: const TextStyle(color: Nura.cream, fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [
                    _chip('Pronunciation $score'),
                    _chip('Fluency ${score - 8}'),
                    _chip('Clarity ${score + 6}'),
                  ],
                ),
                const SizedBox(height: 18),
              ],
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
              const SizedBox(height: 18),
              if (lastHeard != null)
                FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: Nura.terr),
                  onPressed: () {
                    if (turn < scene.turns.length - 1) {
                      setState(() {
                        turn++;
                        lastHeard = null;
                      });
                    } else {
                      context.go('/app');
                    }
                  },
                  child: Text(turn < scene.turns.length - 1 ? i18n.continueCta : 'Bitir'),
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
