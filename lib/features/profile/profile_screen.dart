import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text(i18n.you, style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 16),
          NuraCard(
            color: Nura.forest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.isPlus ? 'NURA Plus' : 'NURA Free', style: const TextStyle(color: Nura.cream, fontSize: 22, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(
                  p.isPlus ? 'Sınırsız konuşma · reklamsız' : i18n.freeMinute,
                  style: const TextStyle(color: Color(0xFFB8C8C0)),
                ),
                const SizedBox(height: 14),
                if (!p.isPlus)
                  FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: Nura.terr),
                    onPressed: () => context.push('/paywall'),
                    child: Text(i18n.plusCta),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Eyebrow('Öğrendiğin dil'),
          const SizedBox(height: 8),
          for (final l in LearnLang.values)
            ChoiceTile(
              leading: Text(l.flag(), style: const TextStyle(fontSize: 20)),
              title: l.label(p.uiLang),
              selected: p.learnLang == l,
              onTap: () => ref.read(sessionProvider.notifier).setLearn(l),
            ),
          const SizedBox(height: 8),
          const Eyebrow('Ana dil / arayüz'),
          const SizedBox(height: 8),
          for (final u in UiLang.values)
            ChoiceTile(
              title: u.nativeName(),
              selected: p.uiLang == u,
              onTap: () => ref.read(sessionProvider.notifier).setUi(u),
            ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Plus’ı aç (geliştirici)'),
            subtitle: const Text('Mağaza bağlanınca RevenueCat alır'),
            value: p.isPlus,
            activeThumbColor: Nura.forest,
            onChanged: (v) => ref.read(sessionProvider.notifier).setPlus(v),
          ),
          const SizedBox(height: 8),
          const Text(
            'Ekonomi USD kilitli. Reklam eCPM ve AI maliyeti dolar. Mağaza fiyatı yerelleşir.',
            style: TextStyle(color: Nura.muted, fontSize: 13, height: 1.4),
          ),
        ],
      ),
    );
  }
}
