import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/algorithm/cognitive_tracker.dart';
import '../../core/l10n/i18n.dart';
import '../../core/theme/tokens.dart';
import '../../core/utils/clock.dart';
import '../../data/models/models.dart';
import '../../data/srs/srs_state.dart';
import '../../state/session.dart';
import '../../ui/review/swipe_review_card.dart';
import '../../ui/widgets.dart';

/// v1.4 tekrar ekranı (Contract madde 7):
/// Klasik 4 buton YASAK. Akış: kalıbı gör → söyle → "Cevabı göster" →
/// sola kaydır (tekrar) / sağa kaydır (hatırladım).
/// Cevap süresi CognitiveTracker ile ölçülür ve FSRS stabilitesine
/// refleks/hatırlama/tahmin ağırlığı olarak girer.
class ReviewScreen extends ConsumerStatefulWidget {
  const ReviewScreen({super.key});

  @override
  ConsumerState<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends ConsumerState<ReviewScreen> {
  int i = 0;
  bool revealed = false;
  final CognitiveTracker _tracker = CognitiveTracker();

  DateTime get _now => ref.read(clockProvider).nowUtc();

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final due = ref.read(sessionProvider.notifier).duePhrases();

    return Scaffold(
      appBar: NuraAppBar(pageTitle: Text(i18n.review)),
      body: SafeArea(
        child: due.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    i18n.reviewNoDue,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Nura.muted, fontSize: 16),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 24),
                child: Column(
                  children: [
                    Text('${i + 1} / ${due.length}',
                        style: const TextStyle(
                            color: Nura.muted, fontSize: 12)),
                    const SizedBox(height: 18),
                    Expanded(child: _card(i18n, p, due)),
                    const SizedBox(height: 16),
                    if (!revealed)
                      ForestButton(
                        label: i18n.reviewReveal,
                        onPressed: () {
                          setState(() => revealed = true);
                          _tracker.onCardRevealed(_now);
                        },
                      )
                    else
                      Text(
                        i18n.reviewSwipeHint,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Nura.soft, fontSize: 13, height: 1.4),
                      ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _card(I18n i18n, UserProfile p, List<Phrase> due) {
    final phrase = due[i.clamp(0, due.length - 1)];
    final body = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          phrase.glossFor(p.uiLang),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, color: Nura.muted),
        ),
        const SizedBox(height: 22),
        if (revealed)
          Text(
            phrase.target,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Nura.forest,
            ),
          )
        else
          Text(
            i18n.reviewPrompt,
            style: const TextStyle(color: Nura.soft),
          ),
      ],
    );
    return NuraCard(
      child: revealed
          ? SwipeReviewCard(
              onSwipedLeft: () => _grade(due, AnswerQuality.again, false),
              onSwipedRight: () => _grade(due, AnswerQuality.good, true),
              child: body,
            )
          : body,
    );
  }

  Future<void> _grade(
      List<Phrase> due, AnswerQuality quality, bool remembered) async {
    final phrase = due[i.clamp(0, due.length - 1)];
    final cognitive = _tracker.onAnswered(remembered, _now);
    await ref
        .read(sessionProvider.notifier)
        .reviewPhrase(phrase.id, quality, cognitive: cognitive);
    if (!mounted) return;
    setState(() {
      revealed = false;
      i = 0;
    });
  }
}
