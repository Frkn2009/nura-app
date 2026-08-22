import 'package:flutter/foundation.dart';
import 'package:nura/core/utils/clock.dart';
import 'package:nura/data/srs/srs_state.dart';

class SrsMachine {
  const SrsMachine(this.clock);

  final Clock clock;

  SrsResult review({
    required SrsCard card,
    required AnswerQuality quality,
  }) {
    final now = clock.nowUtc();

    final newDifficulty = _nextDifficulty(card.difficulty, quality);
    final newStability = _nextStability(card.stability, newDifficulty, quality);
    final intervalDays = newStability.round().clamp(1, 3650);
    final dueAtUtc = now.add(Duration(days: intervalDays));
    final isAgain = quality == AnswerQuality.again;
    final nextState = _nextState(currentState: card.state, quality: quality);

    final nextCard = card.copyWith(
      state: nextState,
      stability: newStability,
      difficulty: newDifficulty,
      reps: card.reps + 1,
      lapses: card.lapses + (isAgain ? 1 : 0),
      step: isAgain ? 0 : card.step + 1,
      scheduledDays: intervalDays,
      dueAtUtc: dueAtUtc,
      algorithmVersion: 'nura-fsrs-inspired-v1.4',
    );

    return SrsResult(card: nextCard, intervalDays: intervalDays, dueAtUtc: dueAtUtc);
  }

  double _nextDifficulty(double old, AnswerQuality quality) {
    double delta = switch (quality) {
      AnswerQuality.again => 0.15,
      AnswerQuality.hard => 0.05,
      AnswerQuality.good => 0.0,
      AnswerQuality.easy => -0.10,
    };
    return (old + delta).clamp(1.0, 10.0);
  }

  double _nextStability(double oldStability, double difficulty, AnswerQuality quality) {
    double stability = switch (quality) {
      AnswerQuality.again => oldStability * 0.45,
      AnswerQuality.hard => oldStability * 0.80,
      AnswerQuality.good => oldStability * 1.6 * (1.0 + (1.0 / difficulty) * 0.35),
      AnswerQuality.easy => oldStability * 2.2 * (1.0 + (1.0 / difficulty) * 0.60),
    };
    return stability.clamp(0.5, 36500.0);
  }

  SrsCardState _nextState({required SrsCardState currentState, required AnswerQuality quality}) {
    if (quality == AnswerQuality.again) return SrsCardState.relearning;
    return switch (currentState) {
      SrsCardState.newCard || SrsCardState.learning || SrsCardState.relearning => SrsCardState.review,
      _ => currentState,
    };
  }
}

@immutable
class SrsResult {
  const SrsResult({required this.card, required this.intervalDays, required this.dueAtUtc});
  final SrsCard card;
  final int intervalDays;
  final DateTime dueAtUtc;
}
