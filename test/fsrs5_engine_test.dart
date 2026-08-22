import 'package:flutter_test/flutter_test.dart';

import 'package:nura/core/algorithm/fsrs5_engine.dart';

void main() {
  group('NURA Brain (FSRS-5)', () {
    final brain = NuraBrain();
    final now = DateTime.utc(2026, 8, 21, 18, 0, 0);

    test('new card with Good gets FSRS-5 initial stability', () {
      final card = FSRSCard();
      final result = brain.review(card, Rating.good, now);

      expect(result.stability, closeTo(3.2818, 0.0001));
      expect(result.reps, 1);
      expect(result.due, isNotNull);
      expect(result.due!.isAfter(now), true);
    });

    test('Again lowers stability of an existing card', () {
      final card = FSRSCard(
        stability: 5.0,
        difficulty: 5.0,
        reps: 3,
        elapsedDays: 1,
      );
      final result = brain.review(card, Rating.again, now);

      expect(result.stability, lessThan(5.0));
    });

    test('Good grows stability when memory is decaying', () {
      final card = FSRSCard(
        stability: 5.0,
        difficulty: 5.0,
        reps: 3,
        elapsedDays: 1,
      );
      final result = brain.review(card, Rating.good, now);

      expect(result.stability, greaterThan(5.0));
    });

    test('retrievability decays over time', () {
      final fresh = FSRSCard(stability: 5.0, elapsedDays: 0);
      final aged = FSRSCard(stability: 5.0, elapsedDays: 30);

      expect(brain.retrievability(fresh), greaterThan(brain.retrievability(aged)));
    });

    test('interval is never below 1 day', () {
      final card = FSRSCard(stability: 0.1, difficulty: 9.0, reps: 1, elapsedDays: 10);
      final result = brain.review(card, Rating.again, now);

      final days = result.due!.difference(now).inDays;
      expect(days, greaterThanOrEqualTo(1));
    });
  });
}
