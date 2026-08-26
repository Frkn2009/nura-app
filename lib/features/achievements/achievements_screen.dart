import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/achievements.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(sessionProvider);
    final unlocked = profile.achievements;
    return Scaffold(
      appBar: VoxeloAppBar(pageTitle: const Text('Başarımlar')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 16, 22, 30),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Rozet koleksiyonu',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Text(
                  '${unlocked.length} / ${Achievement.values.length}',
                  style: const TextStyle(
                    color: Voxelo.mintDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: unlocked.length / Achievement.values.length,
            ),
            const SizedBox(height: 22),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: .92,
              ),
              itemCount: Achievement.values.length,
              itemBuilder: (context, index) {
                final achievement = Achievement.values[index];
                return _AchievementCard(
                  achievement: achievement,
                  unlocked: unlocked.contains(achievement),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  const _AchievementCard({required this.achievement, required this.unlocked});
  final Achievement achievement;
  final bool unlocked;

  IconData get icon => switch (achievement) {
    Achievement.firstStep => Icons.flag_outlined,
    Achievement.fireStarted => Icons.local_fire_department_outlined,
    Achievement.tenPhrases => Icons.menu_book_outlined,
    Achievement.gamer => Icons.sports_esports_outlined,
    Achievement.traveler => Icons.public_outlined,
    Achievement.plus => Icons.diamond_outlined,
    Achievement.weeklyChampion => Icons.emoji_events_outlined,
    Achievement.dailyHundred => Icons.bolt_outlined,
    Achievement.sevenDayStreak => Icons.whatshot_outlined,
    Achievement.perfect => Icons.track_changes_outlined,
  };

  @override
  Widget build(BuildContext context) {
    final foreground = unlocked ? Voxelo.mintDark : Voxelo.soft;
    return VoxeloCard(
      color: unlocked ? Voxelo.mintLight : Voxelo.cloud,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: unlocked ? Voxelo.mintDark : Voxelo.fog,
              shape: BoxShape.circle,
            ),
            child: Icon(
              unlocked ? icon : Icons.lock_outline,
              color: unlocked ? Colors.white : Voxelo.soft,
            ),
          ),
          const Spacer(),
          Text(
            achievement.title,
            style: TextStyle(
              color: foreground,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            achievement.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Voxelo.muted,
              fontSize: 11,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
