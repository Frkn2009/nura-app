import 'package:flutter_test/flutter_test.dart';
import 'package:nura/data/content/catalog.dart';
import 'package:nura/data/content/clips.dart';
import 'package:nura/data/content/language_guides.dart';
import 'package:nura/data/models/achievements.dart';
import 'package:nura/data/models/leaderboard.dart';
import 'package:nura/data/models/models.dart';
import 'package:nura/data/notifications/notification_service.dart';
import 'package:nura/data/speech/speech_controller.dart';
import 'package:nura/data/translate/offline_translate.dart';
import 'package:nura/state/session.dart';

void main() {
  test('all 30 learn languages have at least 8 scenarios', () {
    for (final lang in LearnLang.values) {
      final n = Catalog.forLang(lang).length;
      expect(n, greaterThanOrEqualTo(8), reason: '${lang.name} has $n scenarios');
    }
  });

  test('Spanish has 10 scenarios (8 base + NIE + contrato)', () {
    expect(Catalog.forLang(LearnLang.es).length, 10);
  });

  test('Arabic A1 pack exists', () {
    expect(Catalog.forLang(LearnLang.ar).length, greaterThanOrEqualTo(5));
    final cafe = Catalog.byId('ar_cafe');
    expect(cafe, isNotNull);
  });

  test('NIE phrase exists in Spanish', () {
    expect(Catalog.byId('es_nie'), isNotNull);
    expect(Catalog.phraseById('es_nie_0')?.target, contains('NIE'));
  });

  test('all 30 languages have a guide', () {
    for (final lang in LearnLang.values) {
      final g = LanguageGuide.of(lang);
      expect(g.lang, lang);
      expect(g.headline.isNotEmpty, true, reason: '${lang.name} guide headline empty');
    }
  });

  test('offline translate hits Spanish rent from Turkish', () {
    final hit = OfflineTranslate.lookup(
      input: 'kira',
      learn: LearnLang.es,
      ui: UiLang.tr,
    );
    expect(hit, isNotNull);
  });

  test('all learn languages have a flag and label', () {
    for (final lang in LearnLang.values) {
      expect(lang.flag().isNotEmpty, true);
      expect(lang.label(UiLang.en).isNotEmpty, true);
      expect(lang.label(UiLang.tr).isNotEmpty, true);
    }
  });

  test('total scenario count is 242', () {
    var total = 0;
    for (final lang in LearnLang.values) {
      total += Catalog.forLang(lang).length;
    }
    expect(total, 242);
  });

  test('pronunciation scoring is honest and deterministic', () {
    expect(SpeechController.pronunciationScore('Hello, world!', ''), 0);
    expect(SpeechController.pronunciationScore('Hello, world!', 'hello world'), 100);
    expect(SpeechController.pronunciationScore('Good morning', 'good evening'), inInclusiveRange(30, 75));
    expect(SpeechController.pronunciationScore('こんにちは', 'こんにちは'), 100);
  });


  test('curriculum translation supports every one of the 30 x 30 directions', () {
    for (final from in LearnLang.values) {
      final source = Catalog.forLang(from).first.phrases.first.target;
      for (final to in LearnLang.values) {
        final hit = OfflineTranslate.translate(input: source, from: from, to: to);
        expect(hit, isNotNull, reason: '${from.name} → ${to.name}');
        expect(hit!.target, isNotEmpty);
        expect(hit.origin, TranslationOrigin.curriculum);
      }
    }
  });

  test('verified dictionary has six entries in all 30 languages', () {
    for (final from in LearnLang.values) {
      final suggestions = OfflineTranslate.suggestions(from);
      expect(suggestions.length, 6, reason: from.name);
      for (final source in suggestions) {
        final hit = OfflineTranslate.translate(
          input: source,
          from: from,
          to: LearnLang.sw,
        );
        expect(hit, isNotNull, reason: '${from.name}: $source');
        expect(hit!.origin, TranslationOrigin.dictionary);
      }
    }
  });


  test('clips are generated from every curriculum phrase in all 30 languages', () {
    for (final language in LearnLang.values) {
      final clips = ClipCatalog.forLang(language);
      final phraseCount = Catalog.forLang(language)
          .fold<int>(0, (total, scenario) => total + scenario.phrases.length);
      expect(clips.length, phraseCount, reason: language.name);
      expect(clips, isNotEmpty, reason: language.name);
      expect(clips.every((clip) => clip.scenario.lang == language), true);
    }
  });


  test('XP ranks, daily goal and game rewards follow the product rules', () {
    expect(UserProfile.empty.xpRank, XpRank.rookie);
    expect(UserProfile.empty.copyWith(totalXp: 500).xpRank, XpRank.learner);
    expect(UserProfile.empty.copyWith(totalXp: 1500).xpRank, XpRank.speaker);
    expect(UserProfile.empty.copyWith(totalXp: 4000).xpRank, XpRank.master);
    expect(UserProfile.empty.copyWith(totalXp: 10000).xpRank, XpRank.legend);
    expect(UserProfile.empty.copyWith(dailyXp: 100).dailyXpProgress, 1);
    expect(SessionController.gameXpFor(0, 10), 20);
    expect(SessionController.gameXpFor(10, 10), 200); // 100 cevap + 100 performans
  });

  test('legacy profiles migrate to zero XP without data loss', () {
    final restored = UserProfile.fromJson(UserProfile.empty.toJson()
      ..remove('totalXp')
      ..remove('dailyXp')
      ..remove('xpDayKey'));
    expect(restored.totalXp, 0);
    expect(restored.dailyXp, 0);
    expect(restored.learnLang, UserProfile.empty.learnLang);
  });


  test('leaderboard rows parse rank, XP and own-position marker', () {
    final entry = LeaderboardEntry.fromJson({
      'rank': 12,
      'user_id': 'user-1',
      'player_name': 'NURA A1B2',
      'xp': 340,
      'is_me': true,
    });
    expect(entry.rank, 12);
    expect(entry.xp, 340);
    expect(entry.isMe, true);
  });


  test('all ten achievements have metadata and persist in profiles', () {
    expect(Achievement.values.length, 10);
    for (final achievement in Achievement.values) {
      expect(achievement.title, isNotEmpty);
      expect(achievement.description, isNotEmpty);
    }
    final profile = UserProfile.empty.copyWith(
      completedScenes: 3,
      gamesCompleted: 2,
      completedLanguages: {LearnLang.en, LearnLang.es, LearnLang.de},
      achievements: {Achievement.firstStep, Achievement.gamer},
    );
    final restored = UserProfile.fromJson(profile.toJson());
    expect(restored.completedLanguages.length, 3);
    expect(restored.achievements, containsAll(profile.achievements));
  });


  test('daily notification copy covers lesson, streak, game and Plus', () {
    final base = UserProfile.empty;
    expect(NotificationService.contentFor(base, 0).$1, contains('Hadi derse!'));
    expect(NotificationService.contentFor(base.copyWith(streak: 5), 1).$2, contains('5 gün'));
    expect(NotificationService.contentFor(base, 2).$2, contains('Harf Sıralama'));
    expect(NotificationService.contentFor(base.copyWith(isPlus: true), 0).$1, 'NURA Plus');
  });

  test('notification preference and hour persist', () {
    final restored = UserProfile.fromJson(
      UserProfile.empty.copyWith(notificationsEnabled: false, reminderHour: 10).toJson(),
    );
    expect(restored.notificationsEnabled, false);
    expect(restored.reminderHour, 10);
  });

}
