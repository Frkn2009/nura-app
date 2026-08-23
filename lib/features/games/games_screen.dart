import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../data/ads/ad_service.dart';
import '../../data/content/catalog.dart';
import '../../data/models/models.dart';
import '../../data/speech/speech_controller.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class GamesScreen extends ConsumerWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(sessionProvider);
    Future<int> completeGame(int correct, int total) async {
      final earned = await ref
          .read(sessionProvider.notifier)
          .completeGame(correct, total);
      final latest = ref.read(sessionProvider);
      if (latest.canShowInterstitial() && await AdService.showInterstitial()) {
        await ref.read(sessionProvider.notifier).recordInterstitial();
      }
      return earned;
    }

    final games = <_GameDefinition>[
      _GameDefinition(
        'Doğru / Yanlış',
        'Çeviri eşleşmesini değerlendir',
        Icons.rule_rounded,
        Nura.mint,
        () => TrueFalseGameScreen(
          lang: profile.learnLang,
          ui: profile.uiLang,
          onComplete: completeGame,
        ),
      ),
      _GameDefinition(
        'Harf Sıralama',
        'Karışık harflerden kelime kur',
        Icons.sort_by_alpha_rounded,
        Nura.sky,
        () => LetterOrderGameScreen(
          lang: profile.learnLang,
          ui: profile.uiLang,
          onComplete: completeGame,
        ),
      ),
      _GameDefinition(
        'Ses Bulmaca',
        'Dinle ve dört seçenekten bul',
        Icons.headphones_rounded,
        Nura.lavender,
        () => AudioPuzzleScreen(
          lang: profile.learnLang,
          ui: profile.uiLang,
          onComplete: completeGame,
        ),
      ),
      _GameDefinition(
        'Boşluk Doldur',
        'Eksik kelimeyi tamamla',
        Icons.edit_note_rounded,
        Nura.coral,
        () => FillBlankGameScreen(
          lang: profile.learnLang,
          ui: profile.uiLang,
          onComplete: completeGame,
        ),
      ),
      _GameDefinition(
        'Zamana Karşı',
        '60 saniyede en çok doğru',
        Icons.timer_outlined,
        Nura.sunflower,
        () => TimedGameScreen(
          lang: profile.learnLang,
          ui: profile.uiLang,
          onComplete: completeGame,
        ),
      ),
    ];

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text('Oyunlar', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 5),
          Text(
            '${profile.learnLang.flag()} ${profile.learnLang.label(profile.uiLang)} · 5 özgün pratik',
            style: const TextStyle(color: Nura.muted),
          ),
          const SizedBox(height: 20),
          for (final game in games) ...[
            _GameCard(definition: game),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _GameDefinition {
  const _GameDefinition(
    this.title,
    this.subtitle,
    this.icon,
    this.color,
    this.screen,
  );
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget Function() screen;
}

class _GameCard extends StatelessWidget {
  const _GameCard({required this.definition});
  final _GameDefinition definition;

  @override
  Widget build(BuildContext context) => NuraCard(
    onTap: () => Navigator.of(
      context,
      rootNavigator: true,
    ).push(MaterialPageRoute<void>(builder: (_) => definition.screen())),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: definition.color.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(Nura.radius),
          ),
          child: Icon(definition.icon, color: definition.color),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                definition.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                definition.subtitle,
                style: const TextStyle(color: Nura.muted, fontSize: 13),
              ),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: Nura.soft),
      ],
    ),
  );
}

class TrueFalseGameScreen extends StatefulWidget {
  const TrueFalseGameScreen({
    super.key,
    required this.lang,
    required this.ui,
    required this.onComplete,
  });
  final LearnLang lang;
  final UiLang ui;
  final Future<int> Function(int correct, int total) onComplete;

  @override
  State<TrueFalseGameScreen> createState() => _TrueFalseGameScreenState();
}

class _TrueFalseGameScreenState extends State<TrueFalseGameScreen> {
  final random = Random();
  late final List<Phrase> deck;
  int round = 0;
  int correct = 0;
  late Phrase phrase;
  late String proposed;
  late bool statementIsTrue;
  bool answered = false;
  bool lastRight = false;

  @override
  void initState() {
    super.initState();
    deck = Catalog.allPhrases(widget.lang)..shuffle(random);
    _prepare();
  }

  void _prepare() {
    phrase = deck[round % deck.length];
    statementIsTrue = random.nextBool();
    proposed = statementIsTrue
        ? phrase.glossFor(widget.ui)
        : _differentPhrases(deck, phrase, 1, random).first.glossFor(widget.ui);
    answered = false;
  }

  void _answer(bool choice) {
    if (answered) return;
    final right = choice == statementIsTrue;
    setState(() {
      answered = true;
      lastRight = right;
      if (right) correct++;
    });
    Future<void>.delayed(const Duration(milliseconds: 650), () {
      if (!mounted) return;
      if (round == 9) {
        showGameResult(
          context,
          title: 'Doğru / Yanlış',
          correct: correct,
          total: 10,
          onComplete: widget.onComplete,
        );
      } else {
        setState(() {
          round++;
          _prepare();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => _GameScaffold(
    title: 'Doğru / Yanlış',
    progress: (round + 1) / 10,
    child: Column(
      children: [
        const Text('Bu çeviri doğru mu?', style: TextStyle(color: Nura.muted)),
        const SizedBox(height: 24),
        _PromptCard(primary: phrase.target, secondary: proposed),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: answered ? null : () => _answer(false),
                icon: const Icon(Icons.close_rounded),
                label: const Text('Yanlış'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: answered ? null : () => _answer(true),
                icon: const Icon(Icons.check_rounded),
                label: const Text('Doğru'),
              ),
            ),
          ],
        ),
        if (answered) ...[
          const SizedBox(height: 12),
          MascotFeedback(
            correct: lastRight,
            message: lastRight
                ? 'Doğru karar!'
                : 'Doğrusu: ${phrase.glossFor(widget.ui)}',
          ),
        ],
      ],
    ),
  );
}

class LetterOrderGameScreen extends StatefulWidget {
  const LetterOrderGameScreen({
    super.key,
    required this.lang,
    required this.ui,
    required this.onComplete,
  });
  final LearnLang lang;
  final UiLang ui;
  final Future<int> Function(int correct, int total) onComplete;

  @override
  State<LetterOrderGameScreen> createState() => _LetterOrderGameScreenState();
}

class _LetterOrderGameScreenState extends State<LetterOrderGameScreen> {
  final random = Random();
  late final List<Phrase> deck;
  int round = 0;
  int correct = 0;
  late Phrase phrase;
  late List<_LetterTile> available;
  final selected = <_LetterTile>[];

  @override
  void initState() {
    super.initState();
    deck = Catalog.allPhrases(widget.lang)..shuffle(random);
    _prepare();
  }

  void _prepare() {
    phrase = deck[round % deck.length];
    final word = _practiceWord(phrase.target);
    final characters = word.characters.toList();
    available = [
      for (var i = 0; i < characters.length; i++) _LetterTile(i, characters[i]),
    ]..shuffle(random);
    selected.clear();
  }

  void _pick(_LetterTile tile) => setState(() {
    available.remove(tile);
    selected.add(tile);
  });

  void _undo(_LetterTile tile) => setState(() {
    selected.remove(tile);
    available.add(tile);
  });

  void _check() {
    final answer = selected.map((tile) => tile.character).join();
    final expected = _practiceWord(phrase.target);
    final right = _norm(answer) == _norm(expected);
    if (right) correct++;
    if (round == 4) {
      showGameResult(
        context,
        title: 'Harf Sıralama',
        correct: correct,
        total: 5,
        onComplete: widget.onComplete,
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MascotFeedback(
          correct: right,
          message: right ? 'Doğru!' : 'Tekrar dene · $expected',
        ),
      ),
    );
    setState(() {
      round++;
      _prepare();
    });
  }

  @override
  Widget build(BuildContext context) {
    final expectedLength = _practiceWord(phrase.target).characters.length;
    return _GameScaffold(
      title: 'Harf Sıralama',
      progress: (round + 1) / 5,
      child: Column(
        children: [
          Text(
            phrase.glossFor(widget.ui),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Nura.muted),
          ),
          const SizedBox(height: 26),
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 72),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Nura.mintLight,
              borderRadius: BorderRadius.circular(Nura.radius),
              border: Border.all(color: Nura.mint),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final tile in selected)
                  _letter(tile, () => _undo(tile), true),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tile in available)
                _letter(tile, () => _pick(tile), false),
            ],
          ),
          const Spacer(),
          FilledButton(
            onPressed: selected.length == expectedLength ? _check : null,
            child: const Text('Kontrol et'),
          ),
        ],
      ),
    );
  }

  Widget _letter(_LetterTile tile, VoidCallback tap, bool selectedTile) =>
      Material(
        color: selectedTile ? Nura.mintDark : Colors.white,
        borderRadius: BorderRadius.circular(Nura.radiusSm),
        child: InkWell(
          onTap: tap,
          borderRadius: BorderRadius.circular(Nura.radiusSm),
          child: Container(
            constraints: const BoxConstraints(minWidth: 42, minHeight: 44),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              tile.character,
              style: TextStyle(
                color: selectedTile ? Colors.white : Nura.ink,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );
}

class _LetterTile {
  const _LetterTile(this.id, this.character);
  final int id;
  final String character;
}

class AudioPuzzleScreen extends StatefulWidget {
  const AudioPuzzleScreen({
    super.key,
    required this.lang,
    required this.ui,
    required this.onComplete,
  });
  final LearnLang lang;
  final UiLang ui;
  final Future<int> Function(int correct, int total) onComplete;

  @override
  State<AudioPuzzleScreen> createState() => _AudioPuzzleScreenState();
}

class _AudioPuzzleScreenState extends State<AudioPuzzleScreen> {
  final random = Random();
  final speech = SpeechController();
  late final List<Phrase> deck;
  int round = 0;
  int correct = 0;
  late Phrase phrase;
  late List<Phrase> options;
  bool answered = false;
  bool lastRight = false;

  @override
  void initState() {
    super.initState();
    deck = Catalog.allPhrases(widget.lang)..shuffle(random);
    _prepare();
  }

  void _prepare() {
    phrase = deck[round % deck.length];
    options = [phrase, ..._differentPhrases(deck, phrase, 3, random)]
      ..shuffle(random);
    answered = false;
  }

  Future<void> _play() => speech.speakTarget(phrase.target, widget.lang.code);

  void _answer(Phrase choice) {
    if (answered) return;
    final right = choice.id == phrase.id;
    setState(() {
      answered = true;
      lastRight = right;
      if (right) correct++;
    });
    Future<void>.delayed(const Duration(milliseconds: 750), () {
      if (!mounted) return;
      if (round == 9) {
        showGameResult(
          context,
          title: 'Ses Bulmaca',
          correct: correct,
          total: 10,
          onComplete: widget.onComplete,
        );
      } else {
        setState(() {
          round++;
          _prepare();
        });
      }
    });
  }

  @override
  void dispose() {
    speech.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _GameScaffold(
    title: 'Ses Bulmaca',
    progress: (round + 1) / 10,
    child: Column(
      children: [
        const Text(
          'Cümleyi dinle ve anlamını seç',
          style: TextStyle(color: Nura.muted),
        ),
        const SizedBox(height: 24),
        Semantics(
          button: true,
          label: 'Sesi oynat',
          child: InkWell(
            onTap: _play,
            borderRadius: BorderRadius.circular(Nura.radiusLg),
            child: Container(
              width: 112,
              height: 112,
              decoration: const BoxDecoration(
                color: Nura.mintDark,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.volume_up_rounded,
                color: Colors.white,
                size: 46,
              ),
            ),
          ),
        ),
        const Spacer(),
        for (final option in options)
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: OutlinedButton(
              onPressed: answered ? null : () => _answer(option),
              child: Text(
                option.glossFor(widget.ui),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (answered)
          MascotFeedback(
            correct: lastRight,
            message: lastRight
                ? 'Harika dinledin!'
                : 'Nura: dinledikçe daha net olacak.',
          ),
      ],
    ),
  );
}

class FillBlankGameScreen extends StatefulWidget {
  const FillBlankGameScreen({
    super.key,
    required this.lang,
    required this.ui,
    required this.onComplete,
  });
  final LearnLang lang;
  final UiLang ui;
  final Future<int> Function(int correct, int total) onComplete;

  @override
  State<FillBlankGameScreen> createState() => _FillBlankGameScreenState();
}

class _FillBlankGameScreenState extends State<FillBlankGameScreen> {
  final controller = TextEditingController();
  late final List<Phrase> deck;
  int round = 0;
  int correct = 0;
  late Phrase phrase;
  late String answer;
  late String question;

  @override
  void initState() {
    super.initState();
    deck = Catalog.allPhrases(widget.lang)..shuffle(Random());
    _prepare();
  }

  void _prepare() {
    phrase = deck[round % deck.length];
    final words = phrase.target.trim().split(RegExp(r'\s+'));
    if (words.length > 1) {
      final index = words.length ~/ 2;
      answer = words[index].replaceAll(
        RegExp(r'[^\p{L}\p{M}\p{N}]', unicode: true),
        '',
      );
      words[index] = '_____';
      question = words.join(' ');
    } else {
      final characters = phrase.target.characters.toList();
      final index = characters.length ~/ 2;
      answer = characters[index];
      characters[index] = '_';
      question = characters.join();
    }
    controller.clear();
  }

  void _check() {
    final right = _norm(controller.text) == _norm(answer);
    if (right) correct++;
    if (round == 4) {
      showGameResult(
        context,
        title: 'Boşluk Doldur',
        correct: correct,
        total: 5,
        onComplete: widget.onComplete,
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MascotFeedback(
          correct: right,
          message: right ? 'Doğru!' : 'Tekrar dene · $answer',
        ),
      ),
    );
    setState(() {
      round++;
      _prepare();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _GameScaffold(
    title: 'Boşluk Doldur',
    progress: (round + 1) / 5,
    child: Column(
      children: [
        Text(
          phrase.glossFor(widget.ui),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Nura.muted),
        ),
        const SizedBox(height: 26),
        _PromptCard(primary: question),
        const SizedBox(height: 22),
        TextField(
          controller: controller,
          textAlign: TextAlign.center,
          autocorrect: false,
          onSubmitted: (_) => _check(),
          decoration: const InputDecoration(hintText: 'Eksik kelime'),
        ),
        const Spacer(),
        FilledButton(onPressed: _check, child: const Text('Kontrol et')),
      ],
    ),
  );
}

class TimedGameScreen extends StatefulWidget {
  const TimedGameScreen({
    super.key,
    required this.lang,
    required this.ui,
    required this.onComplete,
  });
  final LearnLang lang;
  final UiLang ui;
  final Future<int> Function(int correct, int total) onComplete;

  @override
  State<TimedGameScreen> createState() => _TimedGameScreenState();
}

class _TimedGameScreenState extends State<TimedGameScreen> {
  final random = Random();
  late final List<Phrase> deck;
  Timer? timer;
  int seconds = 60;
  int total = 0;
  int correct = 0;
  late Phrase phrase;
  late List<Phrase> options;

  @override
  void initState() {
    super.initState();
    deck = Catalog.allPhrases(widget.lang)..shuffle(random);
    _prepare();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (seconds <= 1) {
        timer?.cancel();
        setState(() => seconds = 0);
        showGameResult(
          context,
          title: 'Zamana Karşı',
          correct: correct,
          total: total,
          onComplete: widget.onComplete,
        );
      } else {
        setState(() => seconds--);
      }
    });
  }

  void _prepare() {
    phrase = deck[total % deck.length];
    options = [phrase, ..._differentPhrases(deck, phrase, 3, random)]
      ..shuffle(random);
  }

  void _answer(Phrase choice) {
    if (seconds == 0) return;
    setState(() {
      total++;
      if (choice.id == phrase.id) correct++;
      _prepare();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _GameScaffold(
    title: 'Zamana Karşı · ${seconds}s',
    progress: seconds / 60,
    trailing: '$correct doğru',
    child: Column(
      children: [
        const Text('Doğru çeviriyi seç', style: TextStyle(color: Nura.muted)),
        const SizedBox(height: 24),
        _PromptCard(primary: phrase.target),
        const Spacer(),
        for (final option in options)
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: OutlinedButton(
              onPressed: () => _answer(option),
              child: Text(
                option.glossFor(widget.ui),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    ),
  );
}

class _GameScaffold extends StatelessWidget {
  const _GameScaffold({
    required this.title,
    required this.progress,
    required this.child,
    this.trailing,
  });
  final String title;
  final double progress;
  final String? trailing;
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: NuraAppBar(
      pageTitle: Text(title),
      actions: trailing == null
          ? null
          : [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(child: Text(trailing!)),
              ),
            ],
    ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 22),
        child: Column(
          children: [
            LinearProgressIndicator(value: progress.clamp(0, 1).toDouble()),
            const SizedBox(height: 22),
            Expanded(child: child),
          ],
        ),
      ),
    ),
  );
}

class _PromptCard extends StatelessWidget {
  const _PromptCard({required this.primary, this.secondary});
  final String primary;
  final String? secondary;

  @override
  Widget build(BuildContext context) => NuraCard(
    color: Nura.mintLight,
    child: Column(
      children: [
        Text(
          primary,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 23,
            height: 1.3,
            fontWeight: FontWeight.w700,
            color: Nura.ink,
          ),
        ),
        if (secondary != null) ...[
          const SizedBox(height: 14),
          const Divider(),
          const SizedBox(height: 8),
          Text(
            secondary!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              height: 1.35,
              color: Nura.muted,
            ),
          ),
        ],
      ],
    ),
  );
}

Future<void> showGameResult(
  BuildContext context, {
  required String title,
  required int correct,
  required int total,
  required Future<int> Function(int correct, int total) onComplete,
}) async {
  final earnedXp = await onComplete(correct, total);
  if (!context.mounted) return;
  final safeTotal = max(total, 1);
  final percent = (correct * 100 / safeTotal).round();
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NuraMascot(
            size: 76,
            mood: percent >= 70 ? MascotMood.celebrate : MascotMood.encourage,
          ),
          const SizedBox(height: 6),
          Text(
            '$percent%',
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              color: Nura.mintDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$correct / $total doğru',
            style: const TextStyle(color: Nura.muted),
          ),
          const SizedBox(height: 10),
          Text(
            '+$earnedXp XP',
            style: const TextStyle(
              color: Nura.sunflower,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.of(dialogContext).pop();
            Navigator.of(context).pop();
          },
          child: const Text('Tamam'),
        ),
      ],
    ),
  );
}

List<Phrase> _differentPhrases(
  List<Phrase> source,
  Phrase current,
  int count,
  Random random,
) {
  final candidates = source.where((phrase) => phrase.id != current.id).toList()
    ..shuffle(random);
  final unique = <String>{};
  final result = <Phrase>[];
  for (final phrase in candidates) {
    if (unique.add(phrase.target)) result.add(phrase);
    if (result.length == count) break;
  }
  return result;
}

String _practiceWord(String value) {
  final words = value
      .split(RegExp(r'\s+'))
      .map(
        (word) =>
            word.replaceAll(RegExp(r'[^\p{L}\p{M}\p{N}]', unicode: true), ''),
      )
      .where(
        (word) => word.characters.length >= 2 && word.characters.length <= 12,
      )
      .toList();
  if (words.isNotEmpty) return words.first;
  final clean = value.replaceAll(
    RegExp(r'[^\p{L}\p{M}\p{N}]', unicode: true),
    '',
  );
  return clean.characters.take(12).join();
}

String _norm(String value) => value
    .toLowerCase()
    .replaceAll(RegExp(r'[^\p{L}\p{M}\p{N}]', unicode: true), '')
    .trim();
