import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n.dart';
import '../../core/theme/tokens.dart';
import '../../data/content/catalog.dart';
import '../../data/models/models.dart';
import '../../features/guide/language_guide_screen.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class OnboardingFlow extends ConsumerStatefulWidget {
  const OnboardingFlow({super.key});

  @override
  ConsumerState<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends ConsumerState<OnboardingFlow> {
  int step = 0;
  bool _storyDone = false;
  int _storyIndex = 0;
  final _storyController = PageController();

  // --- Seviye tespit testi (placement test) durumu ---
  // Self-report'un yerine, katalogdaki gerçek cümlelerden kısa bir
  // okuma/anlama testi. Sonuç, aşağıdaki `_level()` içinde A1-B2 listesini
  // (öneri olarak) önceden seçili gösteren bir "onay" adımına dönüşür.
  LearnLang? _placementForLang;
  List<_PlacementQuestion> _placementQuestions = [];
  int _placementIndex = 0;
  int? _placementSelectedOption;
  bool _placementShowResult = false;
  Cefr? _placementComputed;
  final Map<Cefr, int> _placementCorrect = {};
  final Map<Cefr, int> _placementTotal = {};

  @override
  void dispose() {
    _storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);

    if (!_storyDone) {
      return _StoryIntro(
        i18n: i18n,
        controller: _storyController,
        index: _storyIndex,
        onIndexChanged: (i) => setState(() => _storyIndex = i),
        onFinish: () => setState(() => _storyDone = true),
      );
    }

    final p = ref.watch(sessionProvider);
    final pages = [
      _native(i18n, p),
      _learn(i18n, p),
      LanguageGuideBody(lang: p.learnLang),
      _why(i18n, p),
      _style(i18n, p),
      _level(i18n, p),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const VoxelithWordmark(),
                  const Spacer(),
                  Text(
                    '${step + 1} / ${pages.length}',
                    style: const TextStyle(color: Voxelith.soft, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: (step + 1) / pages.length,
                minHeight: 4,
                borderRadius: BorderRadius.circular(4),
                color: Voxelith.terr,
                backgroundColor: Voxelith.line,
              ),
              SizedBox(height: step == 0 ? 14 : 28),
              if (step == 0) ...[
                const Center(
                  child: VoxelithMascot(size: 96, mood: MascotMood.wave),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Merhaba, ben Voxelith. Konuşma yolculuğunda yanındayım.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Voxelith.muted, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 14),
              ],
              Expanded(child: pages[step]),
              ForestButton(
                label: step == pages.length - 1
                    ? i18n.startSpeak
                    : i18n.continueCta,
                onPressed: () async {
                  if (step < pages.length - 1) {
                    setState(() => step++);
                  } else {
                    await ref.read(sessionProvider.notifier).finishOnboarding();
                    if (context.mounted) context.go('/app');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _native(I18n i18n, UserProfile p) {
    return ListView(
      children: [
        Text(
          i18n.nativeTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 8),
        const Text(
          'Açıklamalar ve hatalar bu dilde gelir.',
          style: TextStyle(color: Voxelith.muted),
        ),
        const SizedBox(height: 20),
        for (final u in UiLang.values)
          ChoiceTile(
            title: u.nativeName(),
            selected: p.uiLang == u,
            onTap: () => ref.read(sessionProvider.notifier).setUi(u),
          ),
      ],
    );
  }

  Widget _learn(I18n i18n, UserProfile p) {
    return ListView(
      children: [
        Text(i18n.learnTitle, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 8),
        const Text(
          'İlk dili seç. Sonra profilinden ekleyebilirsin.',
          style: TextStyle(color: Voxelith.muted),
        ),
        const SizedBox(height: 20),
        for (final l in LearnLang.values)
          ChoiceTile(
            leading: Text(l.flag(), style: const TextStyle(fontSize: 22)),
            title: l.label(p.uiLang),
            selected: p.learnLang == l,
            onTap: () => ref.read(sessionProvider.notifier).setLearn(l),
          ),
      ],
    );
  }

  Widget _why(I18n i18n, UserProfile p) {
    return ListView(
      children: [
        Text(i18n.whyTitle, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 20),
        for (final m in Motive.values)
          ChoiceTile(
            title: i18n.motive(m),
            selected: p.motive == m,
            onTap: () => ref.read(sessionProvider.notifier).setMotive(m),
          ),
      ],
    );
  }

  Widget _style(I18n i18n, UserProfile p) {
    const options = {
      LearningStyle.balanced: (
        'Dengeli',
        'Önce dinle, gölgele, sonra konuş. Yeni başlayanlar için önerilir.',
      ),
      LearningStyle.speakingFirst: (
        'Konuşma odaklı',
        'Dinlemeyi atla, doğrudan konuşarak öğren. Kendine güvenen ve '
            'hızlı ilerlemek isteyenler için.',
      ),
      LearningStyle.listeningHeavy: (
        'Dinleme ağırlıklı',
        'Konuşmadan önce cümleyi iki kez dinle. Kulağını alıştırmak '
            'isteyenler için.',
      ),
    };
    return ListView(
      children: [
        Text(
          'Nasıl çalışmak istersin?',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 8),
        const Text(
          'İstediğin zaman profilinden değiştirebilirsin.',
          style: TextStyle(color: Voxelith.muted),
        ),
        const SizedBox(height: 20),
        for (final entry in options.entries)
          ChoiceTile(
            title: entry.value.$1,
            subtitle: entry.value.$2,
            selected: p.learningStyle == entry.key,
            onTap: () =>
                ref.read(sessionProvider.notifier).setLearningStyle(entry.key),
          ),
      ],
    );
  }

  static const _levelLabels = {
    Cefr.a1: 'A1 · sıfır / temel',
    Cefr.a2: 'A2 · günlük cümleler',
    Cefr.b1: 'B1 · sohbet',
    Cefr.b2: 'B2 · iş / akıcılık',
  };

  Widget _level(I18n i18n, UserProfile p) {
    if (_placementForLang != p.learnLang) {
      _placementForLang = p.learnLang;
      _placementQuestions = _buildPlacementQuestions(p.learnLang, p.uiLang);
      _placementIndex = 0;
      _placementSelectedOption = null;
      _placementShowResult = false;
      _placementComputed = null;
      _placementCorrect.clear();
      _placementTotal.clear();
    }

    if (_placementQuestions.isEmpty || _placementShowResult) {
      return _levelConfirm(i18n, p);
    }
    return _placementQuestionView(i18n, p);
  }

  Widget _placementQuestionView(I18n i18n, UserProfile p) {
    final q = _placementQuestions[_placementIndex];
    return ListView(
      children: [
        Text(
          'Seviyeni ölçelim',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Soru ${_placementIndex + 1} / ${_placementQuestions.length} · '
          'Bu cümle ne anlama geliyor?',
          style: const TextStyle(color: Voxelith.muted),
        ),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Voxelith.radius),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: Text(
            q.phrase.target,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 20),
        for (int i = 0; i < q.options.length; i++)
          ChoiceTile(
            title: q.options[i],
            selected: _placementSelectedOption == i,
            onTap: () => _selectPlacementOption(q, i),
          ),
      ],
    );
  }

  void _selectPlacementOption(_PlacementQuestion q, int index) {
    if (_placementSelectedOption != null) return;
    setState(() => _placementSelectedOption = index);
    _placementTotal[q.level] = (_placementTotal[q.level] ?? 0) + 1;
    if (index == q.correctIndex) {
      _placementCorrect[q.level] = (_placementCorrect[q.level] ?? 0) + 1;
    }
    Future.delayed(const Duration(milliseconds: 450), () {
      if (!mounted) return;
      if (_placementIndex < _placementQuestions.length - 1) {
        setState(() {
          _placementIndex++;
          _placementSelectedOption = null;
        });
      } else {
        final result = _computePlacementResult();
        _placementComputed = result;
        ref.read(sessionProvider.notifier).setCefr(result);
        setState(() => _placementShowResult = true);
      }
    });
  }

  Cefr _computePlacementResult() {
    var result = Cefr.a1;
    for (final level in Cefr.values) {
      final total = _placementTotal[level] ?? 0;
      if (total == 0) continue; // bu seviyede hiç soru yoktu, atla
      final correct = _placementCorrect[level] ?? 0;
      if (correct * 2 >= total) {
        result = level;
      } else {
        break;
      }
    }
    return result;
  }

  Widget _levelConfirm(I18n i18n, UserProfile p) {
    final computed = _placementComputed;
    return ListView(
      children: [
        Text(i18n.levelTitle, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 8),
        if (computed != null) ...[
          Text(
            'Seviyen: ${_levelLabels[computed]}',
            style: const TextStyle(
              color: Voxelith.terr,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Kısa testine göre önerdik. Yanlış olduğunu düşünüyorsan '
            'aşağıdan değiştirebilirsin.',
            style: TextStyle(color: Voxelith.muted),
          ),
        ] else
          Text(
            i18n.freeMinute,
            style: const TextStyle(
              color: Voxelith.terr,
              fontWeight: FontWeight.w500,
            ),
          ),
        const SizedBox(height: 20),
        for (final c in Cefr.values)
          ChoiceTile(
            title: _levelLabels[c]!,
            selected: p.cefr == c,
            onTap: () => ref.read(sessionProvider.notifier).setCefr(c),
          ),
      ],
    );
  }
}

/// Seviye tespit testindeki tek bir çoktan seçmeli soru: `phrase.target`
/// gösterilir, doğru cevap `phrase`'in kendi `gloss`'u, yanlış seçenekler
/// aynı (mümkünse) veya yakın CEFR seviyesindeki başka cümlelerin
/// gloss'larından örneklenir. Yeni içerik/çeviri üretilmez — tamamen
/// mevcut katalogdan.
class _PlacementQuestion {
  const _PlacementQuestion({
    required this.phrase,
    required this.level,
    required this.options,
    required this.correctIndex,
  });

  final Phrase phrase;
  final Cefr level;
  final List<String> options;
  final int correctIndex;
}

/// Her CEFR seviyesinden (mevcutsa) 2 soru seçerek katalogdan ~6-8 soruluk
/// bir seviye tespit testi üretir. Bir dilin bir seviyede hiç senaryosu
/// yoksa (bazı dillerde B2 çok azdır) o seviye sessizce atlanır — asla
/// crash etmez, sadece daha az soru üretir.
List<_PlacementQuestion> _buildPlacementQuestions(LearnLang lang, UiLang ui) {
  final scenarios = Catalog.forLang(lang);
  if (scenarios.isEmpty) return const [];

  final byLevel = <Cefr, List<Phrase>>{for (final c in Cefr.values) c: []};
  for (final s in scenarios) {
    byLevel[s.cefr]!.addAll(s.phrases);
  }
  final allPhrases = scenarios.expand((s) => s.phrases).toList();
  if (allPhrases.length < 2) return const [];

  final rng = Random();
  final questions = <_PlacementQuestion>[];

  for (final level in Cefr.values) {
    final pool = byLevel[level]!;
    if (pool.isEmpty) continue;
    final picks = ([...pool]..shuffle(rng)).take(2);
    for (final phrase in picks) {
      final correctText = phrase.glossFor(ui);
      if (correctText.isEmpty) continue;

      final seenTexts = <String>{correctText};
      final distractors = <String>[];
      // Önce aynı seviyeden, sonra (yetmezse) dilin tüm havuzundan çeldirici
      // topla — böylece B2 gibi dar havuzlarda da soru kurulabilir.
      for (final source in [pool, allPhrases]) {
        if (distractors.length == 3) break;
        final shuffled = [...source]..shuffle(rng);
        for (final c in shuffled) {
          if (distractors.length == 3) break;
          if (c.id == phrase.id) continue;
          final text = c.glossFor(ui);
          if (text.isEmpty || !seenTexts.add(text)) continue;
          distractors.add(text);
        }
      }
      if (distractors.isEmpty) continue; // çeldirici kurulamadı, soruyu atla

      final options = [correctText, ...distractors]..shuffle(rng);
      questions.add(
        _PlacementQuestion(
          phrase: phrase,
          level: level,
          options: options,
          correctIndex: options.indexOf(correctText),
        ),
      );
    }
  }
  return questions;
}

class _StorySlide {
  const _StorySlide({
    required this.mood,
    required this.title,
    required this.body,
  });
  final MascotMood mood;
  final String title;
  final String body;
}

List<_StorySlide> _storySlides(I18n i18n) => [
  _StorySlide(
    mood: MascotMood.wave,
    title: i18n.storySlide1Title,
    body: i18n.storySlide1Body,
  ),
  _StorySlide(
    mood: MascotMood.encourage,
    title: i18n.storySlide2Title,
    body: i18n.storySlide2Body,
  ),
  _StorySlide(
    mood: MascotMood.celebrate,
    title: i18n.storySlide3Title,
    body: i18n.storySlide3Body,
  ),
];

/// Kurulum sorularından (dil/seviye seçimi) önce gelen kısa anlatı: neden
/// burada olduğunu, uygulamanın neyi vaat ettiğini bir form doldurmadan
/// önce hissettiriyor. Daha önce onboarding doğrudan "Ana dilin hangisi?"
/// sorusuyla açılıyordu — bir "giriş"i, hikayesi yoktu. Metinler `I18n`
/// üzerinden geliyor: cihaz diline göre otomatik değişir (bkz.
/// `SessionController.build` içindeki cihaz dili tespiti).
class _StoryIntro extends StatelessWidget {
  const _StoryIntro({
    required this.i18n,
    required this.controller,
    required this.index,
    required this.onIndexChanged,
    required this.onFinish,
  });

  final I18n i18n;
  final PageController controller;
  final int index;
  final ValueChanged<int> onIndexChanged;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    final slides = _storySlides(i18n);
    final isLast = index == slides.length - 1;
    return Scaffold(
      backgroundColor: Voxelith.forest,
      body: SafeArea(
        child: Stack(
          children: [
            // "Atla" düğmesi Column içinde ayrı bir satır olarak layout
            // alanı kaplarsa aşağıdaki maskotu doğru merkezden aşağı iter —
            // yerel splash ekranı maskotu tam ekran ortasında gösterdiği
            // için bu, uygulama açılışında görünür bir "kayma" yaratıyordu.
            // Üstte yüzen (floating) bir buton olarak layout dışına alındı.
            Positioned(
              top: 0,
              right: 6,
              child: TextButton(
                onPressed: onFinish,
                child: Text(
                  i18n.skipCta,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 44),
                Expanded(
                  child: PageView.builder(
                    controller: controller,
                    itemCount: slides.length,
                    onPageChanged: onIndexChanged,
                    itemBuilder: (_, i) {
                      final s = slides[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VoxelithMascot(size: 120, mood: s.mood),
                            const SizedBox(height: 32),
                            Text(
                              s.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                height: 1.25,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              s.body,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFB8C8C0),
                                fontSize: 15,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(slides.length, (i) {
                    final active = i == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: active ? 22 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: active ? Voxelith.terr : Colors.white24,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 20, 22, 18),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Voxelith.terr,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(52),
                      ),
                      onPressed: () {
                        if (isLast) {
                          onFinish();
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }
                      },
                      child: Text(
                        isLast ? i18n.letsBeginCta : i18n.continueCta,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
