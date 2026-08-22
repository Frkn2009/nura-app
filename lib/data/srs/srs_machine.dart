import 'dart:math' as math;

import 'package:flutter/foundation.dart';

import '../../core/algorithm/cognitive_tracker.dart';
import '../../core/algorithm/fsrs5_engine.dart';
import '../../core/utils/clock.dart';
import 'srs_state.dart';

/// Kalıcı tekrar makinesi: `SrsCard` + kullanıcı puanı (+ isteğe bağlı
/// bilişsel durum) → yeni `SrsCard`.
///
/// Matematik NuraBrain (FSRS-5 inspired) motorundadır; bu sınıf yalnızca
/// veri modelini, zamanı ve durak durum geçişlerini yönetir.
class SrsMachine {
  const SrsMachine(this.clock, [this.brain = const NuraBrain()]);

  final Clock clock;
  final NuraBrain brain;

  SrsResult review({
    required SrsCard card,
    required AnswerQuality quality,
    CognitiveState? cognitive,
  }) {
    final now = clock.nowUtc();

    final elapsedDays = card.lastReviewAtUtc == null
        ? 0.0
        : math.max(
            0.0,
            now.difference(card.lastReviewAtUtc!).inMicroseconds /
                86400000.0,
          );

    final rating = ReviewRating.values[quality.index];
    final base = brain.review(
      stability: card.stability,
      difficulty: card.difficulty,
      reps: card.reps,
      elapsedDays: elapsedDays,
      rating: rating,
      nowUtc: now,
    );

    // Bilişsel mikro-sürtünme: refleks doğru cevap hafızayı güçlendirir,
    // yavaş doğru cevap (tahmin) ve kaçan kart hafifletir.
    var stability = base.stability;
    if (cognitive != null) {
      stability =
          (stability * cognitive.memoryWeight).clamp(0.1, 36500.0).toDouble();
    }

    final intervalDays = brain.nextInterval(stability);
    final dueAtUtc = now.add(Duration(days: intervalDays));
    final isAgain = quality == AnswerQuality.again;

    final nextCard = card.copyWith(
      state: _nextState(card.state, quality),
      stability: stability,
      difficulty: base.difficulty,
      reps: card.reps + 1,
      lapses: card.lapses + (isAgain ? 1 : 0),
      step: isAgain ? 0 : card.step + 1,
      scheduledDays: intervalDays,
      lastReviewAtUtc: now,
      dueAtUtc: dueAtUtc,
      algorithmVersion: SrsCard.algorithmV14,
    );

    return SrsResult(
      card: nextCard,
      intervalDays: intervalDays,
      dueAtUtc: dueAtUtc,
    );
  }

  SrsCardState _nextState(SrsCardState current, AnswerQuality quality) {
    if (quality == AnswerQuality.again) return SrsCardState.relearning;
    switch (current) {
      case SrsCardState.newCard:
      case SrsCardState.learning:
      case SrsCardState.relearning:
        return SrsCardState.review;
      case SrsCardState.review:
      case SrsCardState.suspended:
      case SrsCardState.buried:
        return current;
    }
  }
}

@immutable
class SrsResult {
  const SrsResult({
    required this.card,
    required this.intervalDays,
    required this.dueAtUtc,
  });

  final SrsCard card;
  final int intervalDays;
  final DateTime dueAtUtc;
}
