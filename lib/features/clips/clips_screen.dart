import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../data/content/catalog.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class ClipsScreen extends ConsumerStatefulWidget {
  const ClipsScreen({super.key});

  @override
  ConsumerState<ClipsScreen> createState() => _ClipsScreenState();
}

class _ClipsScreenState extends ConsumerState<ClipsScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final scenes = Catalog.forLang(p.learnLang);
    if (scenes.isEmpty) return const SizedBox.shrink();
    final s = scenes[index.clamp(0, scenes.length - 1)];
    final phrase = s.phrases.first;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 16, 22, 8),
            child: Row(
              children: [
                Text(i18n.clips, style: Theme.of(context).textTheme.displayMedium),
                const Spacer(),
                Text('${index + 1} / ${scenes.length}', style: const TextStyle(color: Nura.muted)),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: scenes.length,
              onPageChanged: (i) => setState(() => index = i),
              itemBuilder: (_, i) {
                final sc = scenes[i];
                final ph = sc.phrases.first;
                return Padding(
                  padding: const EdgeInsets.fromLTRB(22, 8, 22, 16),
                  child: NuraCard(
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 210,
                          decoration: const BoxDecoration(
                            color: Nura.forest,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.play_circle_fill, color: Nura.cream, size: 64),
                              const SizedBox(height: 8),
                              Text(sc.title(p.uiLang), style: const TextStyle(color: Nura.cream)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(ph.target, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600, height: 1.25, color: Nura.ink)),
                              const SizedBox(height: 8),
                              Text(ph.glossFor(p.uiLang), style: const TextStyle(fontSize: 16, color: Nura.muted)),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  _act(Icons.slow_motion_video, i18n.slow),
                                  const SizedBox(width: 8),
                                  _act(Icons.record_voice_over, i18n.shadow),
                                  const SizedBox(width: 8),
                                  _act(Icons.mic, i18n.speak),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                  onPressed: () => ref.read(sessionProvider.notifier).learnPhrase(ph.id),
                                  icon: const Icon(Icons.bookmark_add_outlined),
                                  label: Text(i18n.savePhrase),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('Clip ${index + 1} of ${scenes.length} · ${phrase.glossFor(p.uiLang)}',
                style: const TextStyle(color: Nura.soft, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _act(IconData ic, String l) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(color: Nura.forest, borderRadius: BorderRadius.circular(14)),
        child: Column(
          children: [
            Icon(ic, color: Nura.cream, size: 18),
            const SizedBox(height: 4),
            Text(l, style: const TextStyle(color: Nura.cream, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
