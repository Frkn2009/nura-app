import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../data/supabase/supa_service.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// Tema rengine göre değişen dolgulu ikon rozeti — her temada (Efsane
/// dahil) markaya sabit yeşil/altın yerine o temanın primaryContainer'ını
/// kullanır, böylece ikonlar aktif temayla tutarlı kalır.
class _IconChip extends StatelessWidget {
  const _IconChip(this.icon);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: 38,
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 19, color: scheme.onPrimaryContainer),
    );
  }
}

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
          VoxeloCard(
            color: Voxelo.forest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.isPlus ? 'VOXELO Plus' : 'VOXELO Free',
                  style: const TextStyle(
                    color: Voxelo.cream,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  p.isPlus ? 'Sınırsız konuşma · reklamsız' : i18n.freeMinute,
                  style: const TextStyle(color: Color(0xFFB8C8C0)),
                ),
                const SizedBox(height: 14),
                if (!p.isPlus)
                  FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: Voxelo.terr),
                    onPressed: () => context.push('/paywall'),
                    child: Text(i18n.plusCta),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          VoxeloCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const _IconChip(Icons.bolt_rounded),
                    const SizedBox(width: 10),
                    Text(
                      '${p.totalXp} XP',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      p.xpRank.label,
                      style: const TextStyle(
                        color: Voxelo.mintDark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(value: p.rankProgress),
                const SizedBox(height: 7),
                Text(
                  p.nextXpRank == null
                      ? 'En yüksek seviye'
                      : '${p.nextXpRank!.label} için ${p.nextXpRank!.minimumXp - p.totalXp} XP',
                  style: const TextStyle(color: Voxelo.muted, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxeloCard(
            onTap: () => context.push('/family'),
            child: Row(
              children: [
                const _IconChip(Icons.family_restroom_outlined),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Profil · ${p.profileName}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.swap_horiz, color: Voxelo.soft),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxeloCard(
            onTap: () => context.push('/achievements'),
            child: Row(
              children: [
                const _IconChip(Icons.military_tech_outlined),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Başarımlar · ${p.achievements.length} / 10',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Voxelo.soft),
              ],
            ),
          ),
          const SizedBox(height: 18),
          if (cloudOn) ...[
            const Eyebrow('VOXELO Hesap'),
            const SizedBox(height: 8),
            if (email == null)
              VoxeloCard(
                onTap: () => context.push('/auth'),
                child: const Row(
                  children: [
                    _IconChip(Icons.cloud_outlined),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Hesap oluştur / giriş yap',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Voxelo.soft),
                  ],
                ),
              )
            else
              VoxeloCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const _IconChip(Icons.cloud_done),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            email,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'İlerlemen buluta yedekleniyor. Yeni cihazda giriş yapınca geri gelir.',
                      style: TextStyle(color: Voxelo.muted, fontSize: 13),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () =>
                          ref.read(authEmailProvider.notifier).logout(),
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
          VoxeloCard(
            onTap: () => context.push('/guide'),
            child: Row(
              children: [
                Text(p.learnLang.flag(), style: const TextStyle(fontSize: 22)),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Yazım ve okunuş rehberi',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Voxelo.soft),
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
          const Eyebrow('Görünüm'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final option in const [
                (
                  value: AppThemePreference.system,
                  icon: Icons.brightness_auto_outlined,
                  label: 'Sistem',
                ),
                (
                  value: AppThemePreference.light,
                  icon: Icons.light_mode_outlined,
                  label: 'Açık',
                ),
                (
                  value: AppThemePreference.dark,
                  icon: Icons.dark_mode_outlined,
                  label: 'Koyu',
                ),
                (
                  value: AppThemePreference.amber,
                  icon: Icons.wb_twilight_outlined,
                  label: 'Bal',
                ),
                (
                  value: AppThemePreference.legendary,
                  icon: Icons.auto_awesome,
                  label: 'Efsane',
                ),
                (
                  value: AppThemePreference.legendaryLight,
                  icon: Icons.auto_awesome_outlined,
                  label: 'Efsane (Açık)',
                ),
              ])
                ChoiceChip(
                  selected: p.themePreference == option.value,
                  avatar: Icon(option.icon, size: 18),
                  label: Text(option.label),
                  onSelected: (_) => ref
                      .read(sessionProvider.notifier)
                      .setThemePreference(option.value),
                ),
            ],
          ),
          const SizedBox(height: 16),
          const Eyebrow('Hatırlatmalar'),
          const SizedBox(height: 6),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Günlük pratik bildirimi'),
            subtitle: const Text('Günde yalnızca bir kez'),
            value: p.notificationsEnabled,
            activeThumbColor: Voxelo.mintDark,
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
                  ButtonSegment(
                    value: 10,
                    label: Text('Sabah 10.00'),
                    icon: Icon(Icons.light_mode_outlined),
                  ),
                  ButtonSegment(
                    value: 19,
                    label: Text('Akşam 19.00'),
                    icon: Icon(Icons.nightlight_outlined),
                  ),
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
            activeThumbColor: Voxelo.forest,
            onChanged: (v) => ref.read(sessionProvider.notifier).setPlus(v),
          ),
          ListTile(
            title: const Text('Gizlilik politikası'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/privacy'),
          ),
          ListTile(
            title: const Text(
              'Hesabı sil',
              style: TextStyle(color: Voxelo.terr),
            ),
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
                  content: Text(
                    email != null
                        ? 'Hesabın sunucudan, dil ve kalıplar bu cihazdan silinir. Geri alınmaz.'
                        : 'Dil, seri ve kalıplar bu cihazdan gider. Geri alınmaz.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(c, false),
                      child: const Text('Vazgeç'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(c, true),
                      child: const Text('Sil'),
                    ),
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
            style: const TextStyle(
              color: Voxelo.muted,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
