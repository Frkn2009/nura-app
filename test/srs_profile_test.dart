import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nura/core/utils/clock.dart';
import 'package:nura/data/models/models.dart';
import 'package:nura/data/srs/srs_state.dart';
import 'package:nura/state/session.dart';

/// v1.4 SRS profil entegrasyonu: legacy epoch-gün verisi migrasyonu,
/// FSRS kart yaşam döngüsü ve tema/onboarding kalıcılığı.
void main() {
  group('UserProfile SRS v1.4', () {
    final fakeClock = FakeClock(DateTime(2026, 8, 21, 12, 0, 0));
    final todayEpoch =
        fakeClock.nowUtc().millisecondsSinceEpoch ~/ 86400000;

    late ProviderContainer container;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final preferences = await SharedPreferences.getInstance();
      container = ProviderContainer(
        overrides: [
          prefsProvider.overrideWithValue(preferences),
          clockProvider.overrideWithValue(fakeClock),
        ],
      );
      addTearDown(container.dispose);
    });

    test('legacy epoch-day srs migrates to FSRS cards on load', () {
      final json = UserProfile.empty.toJson()
        ..['srs'] = {
          'en_cafe_0': todayEpoch - 1, // dün vadede → bugün kuyrukta
          'es_hello_0': todayEpoch + 3, // gelecek vadede → kuyrukta değil
        };
      final profile = UserProfile.fromJson(json);

      expect(profile.srsCards.length, 2);
      expect(profile.srsCards['en_cafe_0'], isNotNull);
      expect(profile.srsCards['en_cafe_0']!.algorithmVersion,
          SrsCard.algorithmV14);
    });

    test('duePhrases lists only due cards; good review pushes it out', () async {
      final json = UserProfile.empty.toJson()
        ..['srs'] = {'en_cafe_0': todayEpoch - 1};
      // Profili mock prefs'e yaz, session build() sırasında okusun.
      final prefs = container.read(prefsProvider);
      await prefs.setString('nura.profile.v1', jsonEncode(json));

      final controller = container.read(sessionProvider.notifier);
      expect(controller.duePhrases().map((p) => p.id), contains('en_cafe_0'));

      final result = await controller.reviewPhrase(
        'en_cafe_0',
        AnswerQuality.good,
      );

      expect(result, isNotNull);
      expect(result!.intervalDays, greaterThanOrEqualTo(1));
      // İyi cevap: kart gelecek vadeli → kuyruktan düşer.
      expect(controller.duePhrases(), isEmpty);
      // Legacy köprü harita da yeni vadeye güncellenmiştir.
      final state = container.read(sessionProvider);
      expect(state.srs['en_cafe_0'], todayEpoch + result.intervalDays);
    });

    test('learnPhrase opens a new FSRS card due today', () async {
      final controller = container.read(sessionProvider.notifier);
      await controller.learnPhrase('en_cafe_1');

      final state = container.read(sessionProvider);
      expect(state.srsCards.containsKey('en_cafe_1'), true);
      expect(state.srsCards['en_cafe_1']!.state, SrsCardState.newCard);
      expect(controller.duePhrases().map((p) => p.id), contains('en_cafe_1'));
    });

    test('theme style and onboarding step persist round-trip', () {
      final profile = UserProfile.empty.copyWith(
        themeStyle: NuraThemeStyle.indigo,
        onboardingStep: 3,
      );
      final restored = UserProfile.fromJson(profile.toJson());

      expect(restored.themeStyle, NuraThemeStyle.indigo);
      expect(restored.onboardingStep, 3);
    });

    test('srsCards survive a full json round-trip', () {
      final now = fakeClock.nowUtc();
      final profile = UserProfile.empty.copyWith(
        srsCards: {
          'en_cafe_0': SrsCard.newCard('en_cafe_0', now).copyWith(
            state: SrsCardState.review,
            stability: 7.25,
            difficulty: 4.5,
            reps: 3,
            lastReviewAtUtc: now,
          ),
        },
      );
      final restored = UserProfile.fromJson(profile.toJson());

      final card = restored.srsCards['en_cafe_0']!;
      expect(card.stability, 7.25);
      expect(card.difficulty, 4.5);
      expect(card.reps, 3);
      expect(card.lastReviewAtUtc, now);
    });
  });
}
