import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class AdGateScreen extends ConsumerStatefulWidget {
  const AdGateScreen({super.key});

  @override
  ConsumerState<AdGateScreen> createState() => _AdGateScreenState();
}

class _AdGateScreenState extends ConsumerState<AdGateScreen> {
  bool playing = false;
  int left = 5;

  Future<void> _play() async {
    final p = ref.read(sessionProvider);
    if (!p.canWatchAd) {
      if (mounted) context.push('/paywall');
      return;
    }
    setState(() {
      playing = true;
      left = 5;
    });
    Timer.periodic(const Duration(seconds: 1), (t) async {
      if (!mounted) {
        t.cancel();
        return;
      }
      if (left <= 1) {
        t.cancel();
        await ref.read(sessionProvider.notifier).watchRewardedAd();
        if (mounted) context.pop();
        return;
      }
      setState(() => left--);
    });
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);

    return Scaffold(
      appBar: NuraAppBar(pageTitle: const Text('Süre doldu')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 16, 22, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NuraCard(
                color: Nura.forest,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(i18n.freeMinute, style: const TextStyle(color: Nura.terrSoft)),
                    const SizedBox(height: 8),
                    const Text(
                      'Bugünkü ücretsiz dakikan bitti. Reklam izle, +60 saniye konuş. Ya da Plus’a geç, reklamsız kal.',
                      style: TextStyle(color: Nura.cream, fontSize: 18, height: 1.35),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Text(
                p.canWatchAd
                    ? 'Bugün kalan reklam: ${UserProfile.maxRewardedAdsPerDay - p.adsWatchedToday} / ${UserProfile.maxRewardedAdsPerDay}'
                    : 'Bugünkü reklam hakkı doldu.',
                style: const TextStyle(color: Nura.muted),
              ),
              const Spacer(),
              if (playing)
                Column(
                  children: [
                    const Text('Reklam (önizleme)', style: TextStyle(color: Nura.muted)),
                    const SizedBox(height: 8),
                    Text('$left', style: const TextStyle(fontSize: 56, fontWeight: FontWeight.w700, color: Nura.forest)),
                  ],
                )
              else ...[
                ForestButton(
                  label: p.canWatchAd ? 'Reklam izle · +60 sn' : 'Plus’a geç',
                  onPressed: p.canWatchAd ? _play : () => context.push('/paywall'),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () => context.push('/paywall'),
                  child: Text(i18n.plusCta),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
