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

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
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
                  const NuraWordmark(),
                  const Spacer(),
                  Text(
                    '${step + 1} / ${pages.length}',
                    style: const TextStyle(color: Nura.soft, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: (step + 1) / pages.length,
                minHeight: 4,
                borderRadius: BorderRadius.circular(4),
                color: Nura.terr,
                backgroundColor: Nura.line,
              ),
              SizedBox(height: step == 0 ? 14 : 28),
              if (step == 0) ...[
                const Center(
                  child: NuraMascot(size: 96, mood: MascotMood.wave),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Merhaba, ben Luma. Konuşma yolculuğunda yanındayım.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Nura.muted, fontSize: 13),
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
          style: TextStyle(color: Nura.muted),
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
          style: TextStyle(color: Nura.muted),
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
          style: const TextStyle(color: Nura.terr, fontWeight: FontWeight.w500),
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
