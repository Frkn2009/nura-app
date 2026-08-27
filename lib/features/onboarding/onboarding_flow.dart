import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n.dart';
import '../../core/theme/tokens.dart';
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
                  const VoxeloWordmark(),
                  const Spacer(),
                  Text(
                    '${step + 1} / ${pages.length}',
                    style: const TextStyle(color: Voxelo.soft, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: (step + 1) / pages.length,
                minHeight: 4,
                borderRadius: BorderRadius.circular(4),
                color: Voxelo.terr,
                backgroundColor: Voxelo.line,
              ),
              SizedBox(height: step == 0 ? 14 : 28),
              if (step == 0) ...[
                const Center(
                  child: VoxeloMascot(size: 96, mood: MascotMood.wave),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Merhaba, ben Voxelo. Konuşma yolculuğunda yanındayım.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Voxelo.muted, fontSize: 13),
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
          style: TextStyle(color: Voxelo.muted),
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
          style: TextStyle(color: Voxelo.muted),
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

  Widget _level(I18n i18n, UserProfile p) {
    const labels = {
      Cefr.a1: 'A1 · sıfır / temel',
      Cefr.a2: 'A2 · günlük cümleler',
      Cefr.b1: 'B1 · sohbet',
      Cefr.b2: 'B2 · iş / akıcılık',
    };
    return ListView(
      children: [
        Text(i18n.levelTitle, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 8),
        Text(
          i18n.freeMinute,
          style: const TextStyle(
            color: Voxelo.terr,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        for (final c in Cefr.values)
          ChoiceTile(
            title: labels[c]!,
            selected: p.cefr == c,
            onTap: () => ref.read(sessionProvider.notifier).setCefr(c),
          ),
      ],
    );
  }
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
      backgroundColor: Voxelo.forest,
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
                            VoxeloMascot(size: 120, mood: s.mood),
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
                        color: active ? Voxelo.terr : Colors.white24,
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
                        backgroundColor: Voxelo.terr,
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
