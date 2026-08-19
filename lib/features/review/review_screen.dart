import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class ReviewScreen extends ConsumerStatefulWidget {
  const ReviewScreen({super.key});

  @override
  ConsumerState<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends ConsumerState<ReviewScreen> {
  int i = 0;
  bool revealed = false;

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final due = ref.read(sessionProvider.notifier).duePhrases();

    return Scaffold(
      appBar: AppBar(title: Text(i18n.review)),
      body: SafeArea(
        child: due.isEmpty
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    'Bugün tekrar yok. Konuş, kalıp biriksin.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Nura.muted, fontSize: 16),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 24),
                child: Column(
                  children: [
                    Text('${i + 1} / ${due.length}', style: const TextStyle(color: Nura.muted)),
                    const SizedBox(height: 18),
                    Expanded(
                      child: NuraCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              due[i.clamp(0, due.length - 1)].glossFor(p.uiLang),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18, color: Nura.muted),
                            ),
                            const SizedBox(height: 22),
                            if (revealed)
                              Text(
                                due[i.clamp(0, due.length - 1)].target,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Nura.forest),
                              )
                            else
                              Text(i18n.holdToSpeak.replaceFirst('Konuşmak için basılı tut', 'Söyle, sonra aç'),
                                  style: const TextStyle(color: Nura.soft)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (!revealed)
                      ForestButton(
                        label: 'Cevabı göster',
                        onPressed: () => setState(() => revealed = true),
                      )
                    else
                      Row(
                        children: [
                          Expanded(child: OutlinedButton(onPressed: () => _grade(due, 0), child: const Text('Tekrar'))),
                          const SizedBox(width: 8),
                          Expanded(child: OutlinedButton(onPressed: () => _grade(due, 3), child: const Text('İyi'))),
                          const SizedBox(width: 8),
                          Expanded(
                            child: FilledButton(onPressed: () => _grade(due, 5), child: const Text('Kolay')),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _grade(List<Phrase> due, int q) async {
    final phrase = due[i.clamp(0, due.length - 1)];
    await ref.read(sessionProvider.notifier).grade(phrase.id, q);
    final next = ref.read(sessionProvider.notifier).duePhrases();
    setState(() {
      revealed = false;
      if (next.isEmpty) {
        i = 0;
      } else {
        i = i >= next.length ? 0 : i;
      }
    });
  }
}
