import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../data/content/language_guides.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class LanguageGuideScreen extends ConsumerWidget {
  const LanguageGuideScreen({super.key, this.lang, this.onboarding = false});

  final LearnLang? lang;
  final bool onboarding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(sessionProvider);
    final g = LanguageGuide.of(lang ?? p.learnLang);

    return Scaffold(
      appBar: NuraAppBar(
        pageTitle: Text('${g.lang.flag()}  ${g.lang.label(p.uiLang)}'),
        automaticallyImplyLeading: !onboarding,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 32),
        children: [
          Text(g.headline, style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 10),
          Text(
            g.intro,
            style: const TextStyle(
              color: Nura.muted,
              height: 1.45,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 18),
          NuraCard(
            color: Nura.forest,
            child: Text(
              g.firstWeek,
              style: const TextStyle(
                color: Nura.cream,
                height: 1.4,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 22),
          const Eyebrow('Yazıldı  →  okundu'),
          const SizedBox(height: 10),
          for (final r in g.rules)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: NuraCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _pill(r.written, Nura.forest, Nura.cream),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Nura.terr,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            r.heard,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Nura.ink,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      r.example,
                      style: const TextStyle(
                        color: Nura.forest,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '≈  ${r.exampleSaid}',
                      style: const TextStyle(color: Nura.muted),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      r.why,
                      style: const TextStyle(
                        height: 1.4,
                        color: Nura.ink,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
          const Eyebrow('Bu dilde dikkat'),
          const SizedBox(height: 10),
          for (final t in g.traps)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: NuraCard(
                color: Nura.pale,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Nura.forest,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(t.body, style: const TextStyle(height: 1.4)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _pill(String s, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        s,
        style: TextStyle(color: fg, fontWeight: FontWeight.w700, fontSize: 13),
      ),
    );
  }
}

/// Onboarding içine gömülü, app bar’sız.
class LanguageGuideBody extends StatelessWidget {
  const LanguageGuideBody({super.key, required this.lang});
  final LearnLang lang;

  @override
  Widget build(BuildContext context) {
    final g = LanguageGuide.of(lang);
    return ListView(
      children: [
        Text(g.headline, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 8),
        Text(
          'Konuşmadan önce 2 dakika. Yazıldığı gibi okunmaz.',
          style: const TextStyle(color: Nura.muted),
        ),
        const SizedBox(height: 14),
        NuraCard(
          color: Nura.forest,
          child: Text(
            g.firstWeek,
            style: const TextStyle(color: Nura.cream, height: 1.4),
          ),
        ),
        const SizedBox(height: 14),
        for (final r in g.rules.take(4))
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: NuraCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${r.written}  →  ${r.heard}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Nura.forest,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${r.example}   ≈   ${r.exampleSaid}',
                    style: const TextStyle(color: Nura.muted, fontSize: 13),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    r.why,
                    style: const TextStyle(height: 1.35, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        const Text(
          'Kalan kurallar ve tuzaklar uygulama içinde. Dil rehberi her zaman Sen sekmesinde.',
          style: TextStyle(color: Nura.soft, fontSize: 12),
        ),
      ],
    );
  }
}
