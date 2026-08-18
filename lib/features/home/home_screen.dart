import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/content/catalog.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final scene = ref.read(sessionProvider.notifier).todayScenario();
    final remain = p.remainingSpeakSeconds();
    final list = Catalog.forLang(p.learnLang);
    final idx = list.indexWhere((s) => s.id == scene.id);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text(i18n.goodEvening, style: const TextStyle(color: Nura.forest, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Day ${p.streak.clamp(1, 999)} · ${i18n.minutesLeft((p.dailyGoalMin).clamp(1, 60))}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(
                width: 64,
                height: 64,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: p.isPlus ? 1 : remain / 60,
                      color: Nura.terr,
                      backgroundColor: Nura.line,
                      strokeWidth: 5,
                    ),
                    Text(p.isPlus ? '∞' : '${remain}s', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Nura.forest,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(i18n.todaySpeak, style: const TextStyle(color: Nura.cream, fontSize: 22, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Text(
                  '${scene.minutes} dk · ${scene.title(p.uiLang)}',
                  style: const TextStyle(color: Color(0xFFB8C8C0), fontSize: 15),
                ),
                const SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Nura.terr,
                      foregroundColor: Nura.cream,
                      minimumSize: const Size(160, 44),
                    ),
                    onPressed: () => context.push('/session?id=${scene.id}'),
                    child: Text(i18n.startSpeak),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 92,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (_, i) {
                final s = list[i];
                final current = s.id == scene.id;
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: i < idx
                          ? Nura.forest
                          : current
                              ? Nura.terr
                              : Nura.line,
                      child: i < idx
                          ? const Icon(Icons.check, size: 16, color: Nura.cream)
                          : Text('${i + 1}', style: TextStyle(color: current ? Nura.cream : Nura.ink, fontSize: 12)),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 72,
                      child: Text(
                        s.title(p.uiLang),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: current ? Nura.terr : Nura.muted),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text('My Progress', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            children: [
              _stat(Icons.local_fire_department, '${p.streak}', i18n.streak, Nura.terr),
              _stat(Icons.public, p.cefr.name.toUpperCase(), 'CEFR', Nura.forest),
              _stat(Icons.menu_book_outlined, '${p.phrasesKnown}', i18n.phrases, Nura.forest),
            ],
          ),
          const SizedBox(height: 16),
          NuraCard(
            child: Row(
              children: [
                const Icon(Icons.campaign_outlined, color: Nura.terr),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    p.isPlus ? 'Plus · reklamsız, sınırsız konuşma' : i18n.freeMinute,
                    style: const TextStyle(fontWeight: FontWeight.w500, color: Nura.ink),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(IconData ic, String v, String l, Color c) {
    return Expanded(
      child: NuraCard(
        child: Column(
          children: [
            Icon(ic, color: c, size: 20),
            const SizedBox(height: 6),
            Text(v, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: c)),
            Text(l, style: const TextStyle(fontSize: 12, color: Nura.muted)),
          ],
        ),
      ),
    );
  }
}
