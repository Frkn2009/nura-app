import 'package:flutter_test/flutter_test.dart';

import 'package:nura/core/algorithm/cognitive_tracker.dart';
import 'package:nura/core/utils/clock.dart';
import 'package:nura/data/srs/srs_machine.dart';
import 'package:nura/data/srs/srs_state.dart';

void main() {
  group('NURA FSRS-inspired SRS (v1.4)', () {
    late FakeClock clock;
    late SrsMachine machine;

    setUp(() {
      clock = FakeClock(DateTime(2026, 8, 21, 18, 0, 0));
      machine = SrsMachine(clock);
    });

    SrsCard baseCard() {
      return SrsCard(
        id: 'test-card-1',
        state: SrsCardState.review,
        stability: 5.0,
        difficulty: 5.0,
        reps: 2,
        lapses: 0,
        step: 2,
        scheduledDays: 5,
        lastReviewAtUtc: null,
        dueAtUtc: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        algorithmVersion: 'test',
      ).copyWith(
        lastReviewAtUtc: clock.nowUtc().subtract(const Duration(days: 5)),
        dueAtUtc: clock.nowUtc(),
      );
    }

    test('Good increases stability and sets future due date', () {
      final result = machine.review(
        card: baseCard(),
        quality: AnswerQuality.good,
      );

      expect(result.card.stability, greaterThan(5.0));
      expect(result.dueAtUtc.isAfter(clock.nowUtc()), true);
      expect(result.card.algorithmVersion, SrsCard.algorithmV14);
      expect(result.card.lastReviewAtUtc, clock.nowUtc());
    });

    test('Again never increases stability and adds lapse', () {
      final result = machine.review(
        card: baseCard(),
        quality: AnswerQuality.again,
      );

      expect(result.card.stability, lessThan(5.0));
      expect(result.card.lapses, 1);
      expect(result.card.state, SrsCardState.relearning);
    });

    test('Easy interval is greater than Good interval', () {
      final easyResult = machine.review(
        card: baseCard(),
        quality: AnswerQuality.easy,
      );

      final goodResult = machine.review(
        card: baseCard(),
        quality: AnswerQuality.good,
      );

      expect(easyResult.intervalDays, greaterThan(goodResult.intervalDays));
    });

    test('Hard interval is smaller than Good interval', () {
      final hardResult = machine.review(
        card: baseCard(),
        quality: AnswerQuality.hard,
      );

      final goodResult = machine.review(
        card: baseCard(),
        quality: AnswerQuality.good,
      );

      expect(hardResult.intervalDays, lessThan(goodResult.intervalDays));
    });

    test('Difficulty stays between 1 and 10', () {
      final result = machine.review(
        card: baseCard(),
        quality: AnswerQuality.again,
      );

      expect(result.card.difficulty, inInclusiveRange(1.0, 10.0));
    });

    test('No negative or zero interval is produced', () {
      final card = baseCard().copyWith(stability: 0.1);

      final result = machine.review(
        card: card,
        quality: AnswerQuality.again,
      );

      expect(result.intervalDays, greaterThanOrEqualTo(1));
    });

    test('New card (reps 0) gets a learning interval and moves to review', () {
      final card = SrsCard.newCard('new-1', clock.nowUtc());
      final result = machine.review(
        card: card,
        quality: AnswerQuality.good,
      );

      expect(result.card.reps, 1);
      expect(result.card.state, SrsCardState.review);
      expect(result.intervalDays, greaterThanOrEqualTo(1));
      expect(result.dueAtUtc.isAfter(clock.nowUtc()), true);
    });

    test('Cognitive reflex answer weighs stability more than a guess', () {
      final reflex = CognitiveState(
        const Duration(milliseconds: 800),
        true,
      );
      final guess = CognitiveState(
        const Duration(seconds: 9),
        true,
      );

      expect(reflex.memoryWeight, greaterThan(guess.memoryWeight));

      final reflexResult = machine.review(
        card: baseCard(),
        quality: AnswerQuality.good,
        cognitive: reflex,
      );
      final guessResult = machine.review(
        card: baseCard(),
        quality: AnswerQuality.good,
        cognitive: guess,
      );

      expect(reflexResult.card.stability, greaterThan(guessResult.card.stability));
    });
  });
}
