import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../data/supabase/supa_service.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final email = ref.watch(authEmailProvider);
    final cloudOn = Supa.enabled;

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
          const SizedBox(height: 12),
          NuraCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.bolt_rounded, color: Nura.sunflower),
                    const SizedBox(width: 8),
                    Text('${p.totalXp} XP', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    Text(p.xpRank.label, style: const TextStyle(color: Nura.mintDark, fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(value: p.rankProgress),
                const SizedBox(height: 7),
                Text(
                  p.nextXpRank == null
                      ? 'En yüksek seviye'
                      : '${p.nextXpRank!.label} için ${p.nextXpRank!.minimumXp - p.totalXp} XP',
                  style: const TextStyle(color: Nura.muted, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          NuraCard(
            onTap: () => context.push('/achievements'),
            child: Row(
              children: [
                const Icon(Icons.military_tech_outlined, color: Nura.sunflower),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Başarımlar · ${p.achievements.length} / 10',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Nura.soft),
              ],
            ),
          ),
          const SizedBox(height: 18),
          if (cloudOn) ...[
            const Eyebrow('NURA Hesap'),
            const SizedBox(height: 8),
            if (email == null)
              NuraCard(
                onTap: () => context.push('/auth'),
                child: const Row(
                  children: [
                    Icon(Icons.cloud_outlined, color: Nura.forest),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text('Hesap oluştur / giriş yap',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    Icon(Icons.chevron_right, color: Nura.soft),
                  ],
                ),
              )
            else
              NuraCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.cloud_done, color: Nura.forest),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(email!,
                              style: const TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'İlerlemen buluta yedekleniyor. Yeni cihazda giriş yapınca geri gelir.',
                      style: TextStyle(color: Nura.muted, fontSize: 13),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => ref.read(authEmailProvider.notifier).logout(),
                      child: const Text('Çıkış yap'),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
          ],
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
          NuraCard(
            onTap: () => context.push('/guide'),
            child: Row(
              children: [
                Text(p.learnLang.flag(), style: const TextStyle(fontSize: 22)),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text('Yazım ve okunuş rehberi', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                const Icon(Icons.chevron_right, color: Nura.soft),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Eyebrow('Ana dil / arayüz'),
          const SizedBox(height: 8),
          for (final u in UiLang.values)
            ChoiceTile(
              title: u.nativeName(),
              selected: p.uiLang == u,
              onTap: () => ref.read(sessionProvider.notifier).setUi(u),
            ),
          const SizedBox(height: 16),
          const Eyebrow('Hatırlatmalar'),
          const SizedBox(height: 6),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Günlük pratik bildirimi'),
            subtitle: const Text('Günde yalnızca bir kez'),
            value: p.notificationsEnabled,
            activeThumbColor: Nura.mintDark,
            onChanged: (value) => ref
                .read(sessionProvider.notifier)
                .setNotificationsEnabled(value),
          ),
          if (p.notificationsEnabled) ...[
            const SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(value: 10, label: Text('Sabah 10.00'), icon: Icon(Icons.light_mode_outlined)),
                  ButtonSegment(value: 19, label: Text('Akşam 19.00'), icon: Icon(Icons.nightlight_outlined)),
                ],
                selected: {p.reminderHour},
                onSelectionChanged: (hours) => ref
                    .read(sessionProvider.notifier)
                    .setReminderHour(hours.first),
              ),
            ),
          ],
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Plus’ı aç (geliştirici)'),
            subtitle: const Text('Mağaza bağlanınca RevenueCat alır'),
            value: p.isPlus,
            activeThumbColor: Nura.forest,
            onChanged: (v) => ref.read(sessionProvider.notifier).setPlus(v),
          ),
          ListTile(
            title: const Text('Gizlilik politikası'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/privacy'),
          ),
          ListTile(
            title: const Text('Hesabı sil', style: TextStyle(color: Nura.terr)),
            subtitle: Text(
              email != null
                  ? 'Sunucudaki hesabın ve bu cihazdaki ilerleme silinir'
                  : 'Bu telefondaki tüm ilerleme silinir',
            ),
            onTap: () async {
              final ok = await showDialog<bool>(
                context: context,
                builder: (c) => AlertDialog(
                  title: const Text('Hesabı sil?'),
                  content: Text(email != null
                      ? 'Hesabın sunucudan, dil ve kalıplar bu cihazdan silinir. Geri alınmaz.'
                      : 'Dil, seri ve kalıplar bu cihazdan gider. Geri alınmaz.'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('Vazgeç')),
                    TextButton(onPressed: () => Navigator.pop(c, true), child: const Text('Sil')),
                  ],
                ),
              );
              if (ok == true) {
                // Giriş yapılmışsa önce sunucudaki hesabı sil.
                if (email != null) {
                  try {
                    await Supa.deleteAccount();
                  } catch (_) {
                    // Sunucuya ulaşılamadıysa yereli yine de temizle.
                  }
                }
                await ref.read(sessionProvider.notifier).wipeAccount();
                if (context.mounted) context.go('/onboarding');
              }
            },
          ),
          const SizedBox(height: 8),
          Text(
            cloudOn
                ? 'Ekonomi USD kilitli. Ses mümkün olduğunca cihazda.'
                : 'Bulut senkron kapalı: lib/core/supabase_config.dart içine anahtarları girince açılır.',
            style: const TextStyle(color: Nura.muted, fontSize: 13, height: 1.4),
          ),
        ],
      ),
    );
  }
}
