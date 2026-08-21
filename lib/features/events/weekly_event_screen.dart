import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../data/ads/ad_service.dart';
import '../../data/events/weekly_event.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class WeeklyEventScreen extends ConsumerStatefulWidget {
  const WeeklyEventScreen({super.key});

  @override
  ConsumerState<WeeklyEventScreen> createState() => _WeeklyEventScreenState();
}

class _WeeklyEventScreenState extends ConsumerState<WeeklyEventScreen> {
  bool busy = false;
  String? error;

  Future<void> _join() async {
    final profile = ref.read(sessionProvider);
    final event = WeeklyEvent.current();
    if (event.isJoined(profile)) return;
    setState(() {
      busy = true;
      error = null;
    });

    var watched = false;
    if (!profile.isPlus) watched = await AdService.showRewarded();
    if (!mounted) return;
    if (!profile.isPlus && !watched) {
      setState(() {
        busy = false;
        error = AdService.supported
            ? 'Reklam tamamlanmadı. Tekrar deneyebilirsin.'
            : 'Video reklamlar yalnızca iOS ve Android uygulamasında çalışır.';
      });
      return;
    }
    await ref.read(sessionProvider.notifier).joinWeeklyEvent(
          event.id,
          countAd: !profile.isPlus,
        );
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(sessionProvider);
    final event = WeeklyEvent.current();
    final joined = event.isJoined(profile);
    return Scaffold(
      appBar: NuraAppBar(pageTitle: const Text('Haftalık etkinlik')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 30),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF5A273D), Color(0xFFB95443)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(Nura.radiusLg),
              ),
              child: Column(
                children: [
                  const NuraMascot(size: 100, mood: MascotMood.celebrate),
                  const SizedBox(height: 12),
                  Text(event.title, style: const TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text(event.description, textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white70, height: 1.45)),
                ],
              ),
            ),
            const SizedBox(height: 18),
            NuraCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Eyebrow('Nasıl çalışır?'),
                  const SizedBox(height: 10),
                  _line(Icons.play_circle_outline, profile.isPlus ? 'Plus üyeler reklamsız katılır' : 'Bir ödüllü video izle'),
                  _line(Icons.language_outlined, 'Öğrenme dilini İspanyolca seç'),
                  _line(Icons.bolt_outlined, 'Sahne, doğru cevap ve oyun XP’sini ikiye katla'),
                  const SizedBox(height: 8),
                  Text('Etkinlik haftası: ${WeeklyEvent.weekKey()}', style: const TextStyle(color: Nura.muted, fontSize: 12)),
                ],
              ),
            ),
            if (error != null) ...[
              const SizedBox(height: 12),
              Text(error!, textAlign: TextAlign.center, style: const TextStyle(color: Nura.coral)),
            ],
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: joined || busy ? null : _join,
              icon: Icon(joined ? Icons.check_circle_outline : Icons.play_arrow_rounded),
              label: Text(joined
                  ? 'Etkinliğe katıldın'
                  : busy
                      ? 'Video hazırlanıyor…'
                      : (profile.isPlus ? 'Reklamsız katıl' : 'Video izle ve katıl')),
            ),
            if (joined && profile.learnLang != event.language) ...[
              const SizedBox(height: 10),
              const Text('×2 XP için profilinden öğrenme dilini İspanyolca seç.',
                  textAlign: TextAlign.center, style: TextStyle(color: Nura.muted)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _line(IconData icon, String text) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Nura.mintDark),
            const SizedBox(width: 10),
            Expanded(child: Text(text)),
          ],
        ),
      );
}
