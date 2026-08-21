import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/l10n/i18n.dart';
import '../data/content/catalog.dart';
import '../data/models/achievements.dart';
import '../data/models/models.dart';
import '../data/supabase/supa_service.dart';

final prefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('prefs override in main');
});

final sessionProvider = NotifierProvider<SessionController, UserProfile>(SessionController.new);

final i18nProvider = Provider<I18n>((ref) => I18n(ref.watch(sessionProvider).uiLang));

class SessionController extends Notifier<UserProfile> {
  static const _key = 'nura.profile.v1';

  SharedPreferences get _prefs => ref.read(prefsProvider);

  @override
  UserProfile build() {
    final raw = _prefs.getString(_key);
    var p = raw == null ? UserProfile.empty : UserProfile.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    p = _withAchievements(_rollDay(p));
    return p;
  }

  String _today() {
    final now = DateTime.now();
    String two(int value) => value.toString().padLeft(2, '0');
    return '${now.year}-${two(now.month)}-${two(now.day)}';
  }

  bool _isYesterday(String dayKey) {
    final parts = dayKey.split('-').map(int.tryParse).toList();
    if (parts.length != 3 || parts.any((part) => part == null)) return false;
    final previous = DateTime(parts[0]!, parts[1]!, parts[2]!);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return today.difference(previous).inDays == 1;
  }

  UserProfile _rollDay(UserProfile p) {
    final today = _today();
    var rolled = p;
    if (rolled.speakDayKey != today) {
      rolled = rolled.copyWith(
        speakSecondsUsed: 0,
        speakDayKey: today,
        bonusSpeakSeconds: 0,
        adsWatchedToday: 0,
      );
    }
    if (rolled.xpDayKey != today) {
      rolled = rolled.copyWith(dailyXp: 0, xpDayKey: today);
    }
    return rolled;
  }

  UserProfile _withAchievements(UserProfile profile) {
    final unlocked = {...profile.achievements};
    if (profile.completedScenes > 0) unlocked.add(Achievement.firstStep);
    if (profile.streak >= 3) unlocked.add(Achievement.fireStarted);
    if (profile.phrasesKnown >= 10) unlocked.add(Achievement.tenPhrases);
    if (profile.gamesCompleted > 0) unlocked.add(Achievement.gamer);
    if (profile.completedLanguages.length >= 3) unlocked.add(Achievement.traveler);
    if (profile.isPlus) unlocked.add(Achievement.plus);
    if (profile.dailyXp >= UserProfile.dailyXpGoal) unlocked.add(Achievement.dailyHundred);
    if (profile.streak >= 7) unlocked.add(Achievement.sevenDayStreak);
    return profile.copyWith(achievements: unlocked);
  }

  Future<void> _save(UserProfile p) async {
    p = _withAchievements(p);
    state = p;
    await _prefs.setString(_key, jsonEncode(p.toJson()));
    // Giriş yapılmışsa ve anahtarlar girilmişse buluta da yaz.
    // Hata olsa bile akışı kesme; veri yerelde zaten duruyor.
    if (Supa.enabled) {
      unawaited(Supa.pushProfile(p).catchError((_) {}));
    }
  }

  Future<void> setUi(UiLang ui) => _save(state.copyWith(uiLang: ui));
  Future<void> setLearn(LearnLang l) => _save(state.copyWith(learnLang: l));
  Future<void> setMotive(Motive m) => _save(state.copyWith(motive: m));
  Future<void> setCefr(Cefr c) => _save(state.copyWith(cefr: c));
  Future<void> finishOnboarding() => _save(state.copyWith(onboarded: true, streak: 1));
  Future<void> setPlus(bool v) => _save(state.copyWith(isPlus: v));

  Future<void> consumeSpeak(int seconds) async {
    var p = _rollDay(state);
    if (p.isPlus) {
      await _save(p);
      return;
    }
    await _save(p.copyWith(speakSecondsUsed: p.speakSecondsUsed + seconds));
  }

  Future<void> learnPhrase(String id) async {
    final ids = {...state.learnedIds, id};
    final due = {...state.srs, id: _epochDay() + 1};
    await _save(state.copyWith(learnedIds: ids, phrasesKnown: ids.length, srs: due));
  }


  Future<void> awardXp(int amount, {String source = 'correct'}) async {
    if (amount <= 0) return;
    final profile = _rollDay(state);
    final today = _today();
    var nextStreak = profile.streak;
    if (profile.lastPracticeDayKey != today) {
      nextStreak = _isYesterday(profile.lastPracticeDayKey)
          ? (profile.streak <= 0 ? 1 : profile.streak + 1)
          : 1;
    }
    await _save(profile.copyWith(
      totalXp: profile.totalXp + amount,
      dailyXp: profile.dailyXp + amount,
      streak: nextStreak,
      lastPracticeDayKey: today,
    ));
    if (Supa.enabled) {
      unawaited(Supa.recordXp(amount, source).catchError((_) {}));
    }
  }

  /// Doğru cevap XP'si (+10) ve performans oyun bonusu (+20…100).
  static int gameXpFor(int correct, int total) {
    final safeTotal = total <= 0 ? 1 : total;
    final safeCorrect = correct.clamp(0, safeTotal).toInt();
    final performanceBonus = 20 + (80 * safeCorrect / safeTotal).round();
    return safeCorrect * 10 + performanceBonus;
  }

  Future<int> completeGame(int correct, int total) async {
    final earned = gameXpFor(correct, total);
    await awardXp(earned, source: 'game');
    final unlocked = {...state.achievements};
    if (total > 0 && correct >= total) unlocked.add(Achievement.perfect);
    await _save(state.copyWith(
      gamesCompleted: state.gamesCompleted + 1,
      achievements: unlocked,
    ));
    return earned;
  }

  Future<void> completeScene(LearnLang language) async {
    await awardXp(50, source: 'scene');
    await _save(state.copyWith(
      completedScenes: state.completedScenes + 1,
      completedLanguages: {...state.completedLanguages, language},
    ));
  }

  Future<void> unlockAchievement(Achievement achievement) async {
    if (state.achievements.contains(achievement)) return;
    await _save(state.copyWith(
      achievements: {...state.achievements, achievement},
    ));
  }

  Future<void> watchRewardedAd() async {
    var p = _rollDay(state);
    if (!p.canWatchAd) return;
    await _save(p.copyWith(
      bonusSpeakSeconds: p.bonusSpeakSeconds + 60,
      adsWatchedToday: p.adsWatchedToday + 1,
    ));
  }

  List<Phrase> duePhrases() {
    final today = _epochDay();
    final out = <Phrase>[];
    for (final e in state.srs.entries) {
      if (e.value > today) continue;
      final p = Catalog.phraseById(e.key);
      if (p != null) out.add(p);
    }
    return out;
  }

  Future<void> grade(String id, int quality) async {
    // quality: 0 again, 3 good, 5 easy
    final add = switch (quality) {
      >= 5 => 7,
      >= 3 => 3,
      _ => 0,
    };
    final due = {...state.srs, id: _epochDay() + add};
    await _save(state.copyWith(srs: due));
  }

  int _epochDay() => DateTime.now().millisecondsSinceEpoch ~/ 86400000;

  /// Girişten sonra buluttan gelen profili kabul et.
  Future<void> importRemote(UserProfile remote) async {
    await _save(remote);
  }

  /// Yerel profili buluta yaz (girişten hemen sonra, bulutta satır yoksa).
  Future<void> pushCurrent() async {
    await Supa.pushProfile(state);
  }

  Future<void> wipeAccount() async {
    await _prefs.remove(_key);
    state = UserProfile.empty;
  }

  Scenario todayScenario() {
    final list = Catalog.forLang(state.learnLang);
    if (list.isEmpty) {
      return Catalog.forLang(LearnLang.en).first;
    }
    final idx = DateTime.now().day % list.length;
    return list[idx];
  }
}
