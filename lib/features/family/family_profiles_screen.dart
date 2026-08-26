import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class FamilyProfilesScreen extends ConsumerWidget {
  const FamilyProfilesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(sessionProvider);
    final controller = ref.read(sessionProvider.notifier);
    final profiles = controller.familyProfiles();
    return Scaffold(
      appBar: VoxeloAppBar(pageTitle: const Text('Aile profilleri')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 16, 22, 30),
          children: [
            Text(
              'Kimin sırası?',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 7),
            const Text(
              'Her profil kendi dilini, XP’sini, serisini ve tekrarlarını saklar.',
              style: TextStyle(color: Voxelo.muted, height: 1.4),
            ),
            const SizedBox(height: 20),
            for (final profile in profiles) ...[
              _profileCard(
                context,
                ref,
                profile,
                active.profileId == profile.profileId,
              ),
              const SizedBox(height: 10),
            ],
            if (profiles.length < 4) ...[
              const SizedBox(height: 6),
              OutlinedButton.icon(
                onPressed: active.isPlus
                    ? () => _addProfile(context, ref)
                    : () => context.push('/paywall'),
                icon: Icon(
                  active.isPlus
                      ? Icons.person_add_alt_1_outlined
                      : Icons.lock_outline,
                ),
                label: Text(
                  active.isPlus ? 'Profil ekle' : 'Aile profilleri · Plus',
                ),
              ),
            ],
            const SizedBox(height: 12),
            Text(
              '${profiles.length} / 4 profil',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Voxelo.muted, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCard(
    BuildContext context,
    WidgetRef ref,
    UserProfile profile,
    bool selected,
  ) => VoxeloCard(
    color: selected ? Voxelo.mintLight : null,
    onTap: selected
        ? null
        : () => ref
              .read(sessionProvider.notifier)
              .switchFamilyProfile(profile.profileId),
    child: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: selected ? Voxelo.mintDark : Voxelo.cloud,
          child: Text(
            profile.profileName.characters.first.toUpperCase(),
            style: TextStyle(
              color: selected ? Colors.white : Voxelo.ink,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.profileName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${profile.learnLang.flag()} ${profile.totalXp} XP · ${profile.streak} gün',
                style: const TextStyle(color: Voxelo.muted, fontSize: 12),
              ),
            ],
          ),
        ),
        if (selected)
          const Icon(Icons.check_circle, color: Voxelo.mintDark)
        else if (profile.profileId != 'main')
          IconButton(
            tooltip: 'Profili sil',
            onPressed: () => ref
                .read(sessionProvider.notifier)
                .deleteFamilyProfile(profile.profileId),
            icon: const Icon(Icons.delete_outline, color: Voxelo.soft),
          ),
      ],
    ),
  );

  Future<void> _addProfile(BuildContext context, WidgetRef ref) async {
    final text = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Yeni aile profili'),
        content: TextField(
          controller: text,
          autofocus: true,
          maxLength: 24,
          decoration: const InputDecoration(labelText: 'Profil adı'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Vazgeç'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, text.text),
            child: const Text('Ekle'),
          ),
        ],
      ),
    );
    text.dispose();
    if (name == null || name.trim().isEmpty) return;
    await ref.read(sessionProvider.notifier).addFamilyProfile(name);
  }
}
