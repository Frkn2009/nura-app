import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/ads/ad_service.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class AdGateScreen extends ConsumerStatefulWidget {
  const AdGateScreen({super.key});

  @override
  ConsumerState<AdGateScreen> createState() => _AdGateScreenState();
}

class _AdGateScreenState extends ConsumerState<AdGateScreen> {
  bool loading = false;
  bool xpReward = false;
  String? error;

  Future<void> _play() async {
    final profile = ref.read(sessionProvider);
    if (!profile.canWatchAd) {
      if (mounted) context.push('/paywall');
      return;
    }
    setState(() {
      loading = true;
      error = null;
    });
    final earned = await AdService.showRewarded();
    if (!mounted) return;
    if (!earned) {
      setState(() {
        loading = false;
        error = AdService.supported
            ? 'Reklam tamamlanmadı. Ödül için videoyu sonuna kadar izle.'
            : 'Video reklamlar telefonda çalışır. Web’de Plus seçeneğini kullanabilirsin.';
      });
      return;
    }
    await ref.read(sessionProvider.notifier).redeemRewardedAd(xpReward: xpReward);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final profile = ref.watch(sessionProvider);
    return Scaffold(
      appBar: NuraAppBar(pageTitle: const Text('Ödüllü video')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
          children: [
            NuraCard(
              color: Nura.forest,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(i18n.freeMinute, style: const TextStyle(color: Nura.terrSoft)),
                  const SizedBox(height: 8),
                  const Text('Kısa bir video izle ve ödülünü seç. Plus üyeler hiçbir video reklam görmez.',
                      style: TextStyle(color: Nura.cream, fontSize: 18, height: 1.4)),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              profile.canWatchAd
                  ? 'Bugün kalan video: ${UserProfile.maxRewardedAdsPerDay - profile.adsWatchedToday} / ${UserProfile.maxRewardedAdsPerDay}'
                  : 'Bugünkü 5 video sınırına ulaştın.',
              style: const TextStyle(color: Nura.muted),
            ),
            const SizedBox(height: 20),
            const Eyebrow('Ödülünü seç'),
            const SizedBox(height: 8),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, icon: Icon(Icons.mic_none), label: Text('+30 sn konuşma')),
                ButtonSegment(value: true, icon: Icon(Icons.bolt), label: Text('+20 XP')),
              ],
              selected: {xpReward},
              onSelectionChanged: loading ? null : (value) => setState(() => xpReward = value.first),
            ),
            if (error != null) ...[
              const SizedBox(height: 14),
              Text(error!, textAlign: TextAlign.center, style: const TextStyle(color: Nura.coral)),
            ],
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: loading
                  ? null
                  : (profile.canWatchAd ? _play : () => context.push('/paywall')),
              icon: Icon(profile.canWatchAd ? Icons.play_arrow_rounded : Icons.diamond_outlined),
              label: Text(loading
                  ? 'Video hazırlanıyor…'
                  : (profile.canWatchAd ? 'Videoyu izle' : 'Plus’a geç')),
            ),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: () => context.push('/paywall'), child: Text(i18n.plusCta)),
          ],
        ),
      ),
    );
  }
}
