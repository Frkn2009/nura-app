import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/tokens.dart';
import '../../data/content/catalog.dart';
import '../../data/events/weekly_event.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';
import '../onboarding/coach_tour.dart';

/// Uygulamayı ilk kez açan kullanıcıya bir kere gösterilen, gerçek ana
/// sayfa öğelerini işaret eden interaktif tanıtım turu.
const _tourSeenPrefsKey = 'home_tour_seen_v1';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _xpCardKey = GlobalKey();
  final _todaySpeakKey = GlobalKey();
  final _libraryKey = GlobalKey();
  final _reviewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeStartTour());
  }

  Future<void> _maybeStartTour() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_tourSeenPrefsKey) == true) return;
    if (!mounted) return;
    await prefs.setBool(_tourSeenPrefsKey, true);
    if (!mounted) return;
    final i18n = ref.read(i18nProvider);
    CoachTour.start(
      context,
      steps: [
        CoachStep(
          targetKey: _xpCardKey,
          title: i18n.homeTourXpTitle,
          body: i18n.homeTourXpBody,
        ),
        CoachStep(
          targetKey: _todaySpeakKey,
          title: i18n.homeTourSpeakTitle,
          body: i18n.homeTourSpeakBody,
        ),
        CoachStep(
          targetKey: _libraryKey,
          title: i18n.homeTourLibraryTitle,
          body: i18n.homeTourLibraryBody,
        ),
        CoachStep(
          targetKey: _reviewKey,
          title: i18n.homeTourReviewTitle,
          body: i18n.homeTourReviewBody,
        ),
      ],
    );
  }

  @override
  void dispose() {
    CoachTour.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          Text(
            i18n.goodGreeting,
            style: const TextStyle(
              color: Voxelo.forest,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Day ${p.streak.clamp(1, 999)} · ${i18n.minutesLeft((p.dailyGoalMin).clamp(1, 60))}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              if (p.streak >= 2) ...[
                const VoxeloMascot(size: 48, mood: MascotMood.streak),
                const SizedBox(width: 6),
              ],
              SizedBox(
                width: 64,
                height: 64,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: p.isPlus
                          ? 1
                          : (p.speakAllowance == 0
                                ? 0
                                : remain / p.speakAllowance),
                      color: Voxelo.terr,
                      backgroundColor: Voxelo.line,
                      strokeWidth: 5,
                    ),
                    Text(
                      p.isPlus ? '∞' : '${remain}s',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          VoxeloCard(
            key: _xpCardKey,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const IconChip(VoxeloIcon.fire),
                    const SizedBox(width: 8),
                    Text(
                      '${p.totalXp} XP',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      p.xpRank.label,
                      style: const TextStyle(
                        color: Voxelo.mintDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(value: p.dailyXpProgress),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      'Bugün ${p.dailyXp} / ${UserProfile.dailyXpGoal} XP',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      p.dailyXp >= UserProfile.dailyXpGoal
                          ? 'Hedef tamamlandı'
                          : '${UserProfile.dailyXpGoal - p.dailyXp} XP kaldı',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          VoxeloCard(
            onTap: () => context.push('/event'),
            color: const Color(0xFFF5E8E5),
            child: Row(
              children: [
                const Icon(Icons.bolt_rounded, color: Voxelo.coral, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        WeeklyEvent.current().title,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        WeeklyEvent.current().isJoined(p)
                            ? 'Katıldın · İspanyolca pratik yap'
                            : 'Video ile katıl · bu hafta',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Voxelo.coral),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Container(
            key: _todaySpeakKey,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Voxelo.forest,
              borderRadius: BorderRadius.circular(Voxelo.radiusLg),
              boxShadow: [
                BoxShadow(
                  color: Voxelo.forest.withValues(alpha: .35),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  i18n.todaySpeak,
                  style: const TextStyle(
                    color: Voxelo.cream,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${scene.minutes} dk · ${scene.title(p.uiLang)}',
                  style: const TextStyle(
                    color: Color(0xFFB8C8C0),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Voxelo.terr,
                      foregroundColor: Voxelo.cream,
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
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (_, i) {
                final s = list[i];
                final current = s.id == scene.id;
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: i < idx
                          ? Voxelo.forest
                          : current
                          ? Voxelo.terr
                          : Voxelo.line,
                      child: i < idx
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Voxelo.cream,
                            )
                          : Text(
                              '${i + 1}',
                              style: TextStyle(
                                color: current
                                    ? Voxelo.cream
                                    : Theme.of(context).colorScheme.onSurface,
                                fontSize: 12,
                              ),
                            ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 72,
                      child: Text(
                        s.title(p.uiLang),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: current
                              ? Voxelo.terr
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(i18n.progress, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            children: [
              _stat(VoxeloIcon.fire, '${p.streak}', i18n.streak, Voxelo.terr),
              _stat(
                VoxeloIcon.medal,
                p.cefr.name.toUpperCase(),
                'CEFR',
                Voxelo.forest,
              ),
              _stat(
                VoxeloIcon.book,
                '${p.phrasesKnown}',
                i18n.phrases,
                Voxelo.forest,
              ),
            ],
          ),
          const SizedBox(height: 16),
          VoxeloCard(
            onTap: () => context.push('/leaderboard'),
            child: Row(
              children: [
                const IconChip(VoxeloIcon.leaderboard),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Haftalık sıralama',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxeloCard(
            onTap: () => context.push('/alphabet?lang=${p.learnLang.code}'),
            child: Row(
              children: [
                const IconChip(VoxeloIcon.guide),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Alfabe · ${p.learnLang.flag()} harfleri öğren',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxeloCard(
            key: _libraryKey,
            onTap: () => context.push('/library'),
            child: Row(
              children: [
                const IconChip(VoxeloIcon.book),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Kitaplık',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxeloCard(
            onTap: () => context.go('/app/chat'),
            child: Row(
              children: [
                const IconChip(VoxeloIcon.chat),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Serbest Sohbet',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        p.isPlus ? 'Voxelo ile canlı konuş' : 'Plus ile aç',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!p.isPlus)
                  Icon(
                    Icons.lock_outline,
                    size: 18,
                    color: Theme.of(context).colorScheme.outline,
                  )
                else
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).colorScheme.outline,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxeloCard(
            onTap: () => context.push('/guide'),
            child: Row(
              children: [
                Text(p.learnLang.flag(), style: const TextStyle(fontSize: 22)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    i18n.pronunciationGuide(p.learnLang.label(p.uiLang)),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxeloCard(
            key: _reviewKey,
            onTap: () => context.push('/review'),
            child: Row(
              children: [
                const IconChip(VoxeloIcon.replay),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${i18n.review} · ${i18n.reviewReady(ref.read(sessionProvider.notifier).duePhrases().length)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxeloCard(
            child: Row(
              children: [
                const Icon(Icons.campaign_outlined, color: Voxelo.terr),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    p.isPlus
                        ? 'Plus · reklamsız, sınırsız konuşma'
                        : i18n.freeMinute,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(VoxeloIcon ic, String v, String l, Color c) {
    return Expanded(
      child: VoxeloCard(
        child: Column(
          children: [
            IconChip(ic, size: 36),
            const SizedBox(height: 8),
            Text(
              v,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: c,
              ),
            ),
            Text(
              l,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
