import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../data/content/catalog.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// Oyun Hub — kelime eşleştirme, hız yarışı, günlük meydan okuma
class GamesScreen extends ConsumerWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text('🎮 Oyunlar', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 6),
          Text('${p.learnLang.label(p.uiLang)} · XP: ${p.streak * 10 + p.phrasesKnown * 5}',
              style: const TextStyle(color: Nura.muted)),
          const SizedBox(height: 20),

          // Kelime Eşleştirme
          _GameCard(
            icon: '🧩',
            title: 'Kelime Eşleştirme',
            subtitle: 'Çeviriyi bul, eşleştir',
            color: Nura.mint,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MatchGameScreen(lang: p.learnLang, ui: p.uiLang)),
            ),
          ),
          const SizedBox(height: 12),

          // Hız Yarışı
          _GameCard(
            icon: '⚡',
            title: 'Hız Yarışı',
            subtitle: '30 saniyede kaç doğru?',
            color: Nura.coral,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SpeedQuizScreen(lang: p.learnLang, ui: p.uiLang)),
            ),
          ),
          const SizedBox(height: 12),

          // Dinle & Seç
          _GameCard(
            icon: '👂',
            title: 'Dinle & Seç',
            subtitle: 'Sesi duy, doğru cümleyi bul',
            color: Nura.lavender,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ListenGameScreen(lang: p.learnLang, ui: p.uiLang)),
            ),
          ),
          const SizedBox(height: 20),

          // Günlük meydan okuma
          NuraCard(
            color: Nura.sunflower.withValues(alpha: 0.15),
            child: Row(
              children: [
                const Text('🔥', style: TextStyle(fontSize: 28)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Günlük Meydan Okuma', style: TextStyle(fontWeight: FontWeight.w700, color: Nura.ink)),
                      Text('Bugün 3 oyun tamamla · +50 XP', style: const TextStyle(color: Nura.muted, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  const _GameCard({required this.icon, required this.title, required this.subtitle, required this.color, required this.onTap});
  final String icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Nura.radius),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Nura.radius),
          border: Border.all(color: Nura.fog, width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 52, height: 52,
              decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(Nura.radius)),
              child: Center(child: Text(icon, style: const TextStyle(fontSize: 26))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Nura.ink)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(color: Nura.muted, fontSize: 13)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: color),
          ],
        ),
      ),
    );
  }
}

// ==================== KELIME EŞLEŞTİRME ====================

class MatchGameScreen extends StatefulWidget {
  const MatchGameScreen({super.key, required this.lang, required this.ui});
  final LearnLang lang;
  final UiLang ui;

  @override
  State<MatchGameScreen> createState() => _MatchGameScreenState();
}

class _MatchGameScreenState extends State<MatchGameScreen> {
  late List<Phrase> phrases;
  late List<String> targets;
  late List<String> glosses;
  String? selectedTarget;
  String? selectedGloss;
  final matched = <String>{};
  int score = 0;

  @override
  void initState() {
    super.initState();
    _loadRound();
  }

  void _loadRound() {
    final all = Catalog.allPhrases(widget.lang);
    all.shuffle(Random());
    phrases = all.take(5).toList();
    targets = phrases.map((p) => p.target).toList()..shuffle(Random());
    glosses = phrases.map((p) => p.glossFor(widget.ui)).toList()..shuffle(Random());
    selectedTarget = null;
    selectedGloss = null;
    matched.clear();
    score = 0;
  }

  void _tryMatch() {
    if (selectedTarget == null || selectedGloss == null) return;
    final phrase = phrases.firstWhere((p) => p.target == selectedTarget, orElse: () => phrases.first);
    if (phrase.glossFor(widget.ui) == selectedGloss) {
      setState(() {
        matched.add(selectedTarget!);
        score++;
        selectedTarget = null;
        selectedGloss = null;
      });
      if (matched.length == phrases.length) {
        _showResult();
      }
    } else {
      setState(() {
        selectedTarget = null;
        selectedGloss = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ Yanlış eşleşme, tekrar dene!'), duration: Duration(seconds: 1)),
      );
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('🎉 Tebrikler!'),
        content: Text('$score / ${phrases.length} doğru eşleşme!\n+${score * 10} XP'),
        actions: [
          TextButton(onPressed: () { Navigator.pop(c); setState(() => _loadRound()); }, child: const Text('Tekrar')),
          TextButton(onPressed: () { Navigator.pop(c); Navigator.pop(context); }, child: const Text('Çıkış')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NuraAppBar(pageTitle: const Text('🧩 Kelime Eşleştirme')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sol: hedef dil
              Expanded(
                child: Column(
                  children: [
                    const Text('Hedef Dil', style: TextStyle(fontWeight: FontWeight.w600, color: Nura.mint)),
                    const SizedBox(height: 8),
                    for (final t in targets)
                      if (!matched.contains(t))
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: InkWell(
                            onTap: () { setState(() => selectedTarget = t); _tryMatch(); },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: selectedTarget == t ? Nura.mint.withValues(alpha: 0.15) : Colors.white,
                                borderRadius: BorderRadius.circular(Nura.radius),
                                border: Border.all(color: selectedTarget == t ? Nura.mint : Nura.fog, width: selectedTarget == t ? 2 : 1),
                              ),
                              child: Text(t, style: TextStyle(fontWeight: selectedTarget == t ? FontWeight.w700 : FontWeight.w500, fontSize: 14)),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Sağ: çeviri
              Expanded(
                child: Column(
                  children: [
                    const Text('Çeviri', style: TextStyle(fontWeight: FontWeight.w600, color: Nura.coral)),
                    const SizedBox(height: 8),
                    for (final g in glosses)
                      if (!matched.values.any((m) => phrases.any((p) => p.glossFor(widget.ui) == g && matched.contains(p.target))))
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: InkWell(
                            onTap: () { setState(() => selectedGloss = g); _tryMatch(); },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: selectedGloss == g ? Nura.coral.withValues(alpha: 0.15) : Colors.white,
                                borderRadius: BorderRadius.circular(Nura.radius),
                                border: Border.all(color: selectedGloss == g ? Nura.coral : Nura.fog, width: selectedGloss == g ? 2 : 1),
                              ),
                              child: Text(g, style: TextStyle(fontWeight: selectedGloss == g ? FontWeight.w700 : FontWeight.w500, fontSize: 14)),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== HIZ YARIŞI ====================

class SpeedQuizScreen extends StatefulWidget {
  const SpeedQuizScreen({super.key, required this.lang, required this.ui});
  final LearnLang lang;
  final UiLang ui;

  @override
  State<SpeedQuizScreen> createState() => _SpeedQuizScreenState();
}

class _SpeedQuizScreenState extends State<SpeedQuizScreen> {
  late List<Phrase> allPhrases;
  int correct = 0;
  int total = 0;
  int timeLeft = 30;
  Timer? timer;
  late Phrase current;
  late List<String> options;
  bool finished = false;

  @override
  void initState() {
    super.initState();
    allPhrases = Catalog.allPhrases(widget.lang);
    allPhrases.shuffle(Random());
    _nextQuestion();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        timeLeft--;
        if (timeLeft <= 0) { finished = true; timer?.cancel(); }
      });
    });
  }

  void _nextQuestion() {
    if (allPhrases.isEmpty) return;
    current = allPhrases[total % allPhrases.length];
    final wrongAnswers = (allPhrases.toList()..shuffle(Random()))
        .where((p) => p.id != current.id)
        .take(3)
        .map((p) => p.glossFor(widget.ui))
        .toList();
    options = [...wrongAnswers, current.glossFor(widget.ui)]..shuffle(Random());
  }

  void _answer(String chosen) {
    if (finished) return;
    setState(() {
      total++;
      if (chosen == current.glossFor(widget.ui)) correct++;
      _nextQuestion();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (finished) {
      return Scaffold(
        appBar: NuraAppBar(pageTitle: const Text('⚡ Sonuç')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$correct', style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w800, color: Nura.mint)),
              Text('/ $total doğru', style: const TextStyle(fontSize: 20, color: Nura.muted)),
              const SizedBox(height: 8),
              Text('+${correct * 15} XP', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Nura.sunflower)),
              const SizedBox(height: 24),
              FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Tamam')),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: NuraAppBar(
        pageTitle: Text('⚡ $timeLeft saniye'),
        actions: [Padding(padding: const EdgeInsets.only(right: 16, top: 16), child: Text('$correct ✓', style: const TextStyle(color: Nura.mint, fontWeight: FontWeight.w700)))],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
          child: Column(
            children: [
              LinearProgressIndicator(value: timeLeft / 30, color: timeLeft > 10 ? Nura.mint : Nura.coral, backgroundColor: Nura.fog),
              const SizedBox(height: 28),
              Text(current.target, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Nura.ink)),
              const SizedBox(height: 8),
              const Text('Doğru çeviriyi seç', style: TextStyle(color: Nura.muted)),
              const Spacer(),
              for (final o in options)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => _answer(o),
                      child: Text(o, textAlign: TextAlign.center),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== DİNLE & SEÇ ====================

class ListenGameScreen extends StatefulWidget {
  const ListenGameScreen({super.key, required this.lang, required this.ui});
  final LearnLang lang;
  final UiLang ui;

  @override
  State<ListenGameScreen> createState() => _ListenGameScreenState();
}

class _ListenGameScreenState extends State<ListenGameScreen> {
  late List<Phrase> allPhrases;
  int correct = 0;
  int round = 0;
  late Phrase current;
  late List<String> options;
  bool? lastCorrect;

  @override
  void initState() {
    super.initState();
    allPhrases = Catalog.allPhrases(widget.lang);
    allPhrases.shuffle(Random());
    _nextRound();
  }

  void _nextRound() {
    current = allPhrases[round % allPhrases.length];
    final wrong = (allPhrases.toList()..shuffle(Random()))
        .where((p) => p.id != current.id)
        .take(3)
        .map((p) => p.target)
        .toList();
    options = [...wrong, current.target]..shuffle(Random());
    lastCorrect = null;
  }

  void _answer(String chosen) {
    setState(() {
      lastCorrect = chosen == current.target;
      if (lastCorrect!) correct++;
      round++;
    });
    Future.delayed(const Duration(milliseconds: 800), () {
      if (round >= 10) {
        _showResult();
      } else {
        setState(() => _nextRound());
      }
    });
  }

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => AlertDialog(
        title: const Text('👂 Sonuç'),
        content: Text('$correct / 10 doğru\n+${correct * 10} XP'),
        actions: [
          TextButton(onPressed: () { Navigator.pop(c); Navigator.pop(context); }, child: const Text('Tamam')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NuraAppBar(pageTitle: Text('👂 Dinle & Seç · ${round + 1}/10')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 16, 22, 22),
          child: Column(
            children: [
              LinearProgressIndicator(value: round / 10, color: Nura.lavender, backgroundColor: Nura.fog),
              const SizedBox(height: 28),
              Text(current.glossFor(widget.ui), textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Nura.ink)),
              const SizedBox(height: 8),
              const Text('Hangi cümle bu?', style: TextStyle(color: Nura.muted)),
              const Spacer(),
              for (final o in options)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: lastCorrect != null ? null : () => _answer(o),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: lastCorrect != null && o == current.target ? Nura.mint.withValues(alpha: 0.15) : null,
                      ),
                      child: Text(o, textAlign: TextAlign.center),
                    ),
                  ),
                ),
              if (lastCorrect != null)
                Text(
                  lastCorrect! ? '✅ Doğru!' : '❌ Yanlış — ${current.target}',
                  style: TextStyle(color: lastCorrect! ? Nura.mint : Nura.coral, fontWeight: FontWeight.w700),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
