import 'package:flutter_test/flutter_test.dart';
import 'package:voxelo/core/utils/clock.dart';
import 'package:voxelo/data/srs/srs_machine.dart';
import 'package:voxelo/data/srs/srs_state.dart';

void main() {
  group('VOXELO FSRS-inspired SRS', () {
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
        dueAtUtc: clock.nowUtc(),
        algorithmVersion: 'test',
      );
    }

    test('Good increases stability and sets future due date', () {
      final result = machine.review(
        card: baseCard(),
        quality: AnswerQuality.good,
      );
      expect(result.card.stability, greaterThan(5.0));
      expect(result.dueAtUtc.isAfter(clock.nowUtc()), true);
      expect(result.card.algorithmVersion, 'voxelo-fsrs-inspired-v1.4');
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
      final result = machine.review(card: card, quality: AnswerQuality.again);
      expect(result.intervalDays, greaterThanOrEqualTo(1));
    });
  });
}
