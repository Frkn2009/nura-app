import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/l10n/i18n.dart';
import '../data/content/catalog.dart';
import '../data/models/models.dart';

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
    p = _rollDay(p);
    return p;
  }

  String _today() {
    final n = DateTime.now();
    return '${n.year}-${n.month}-${n.day}';
  }

  UserProfile _rollDay(UserProfile p) {
    final t = _today();
    if (p.speakDayKey == t) return p;
    return p.copyWith(
      speakSecondsUsed: 0,
      speakDayKey: t,
      bonusSpeakSeconds: 0,
      adsWatchedToday: 0,
    );
  }

  Future<void> _save(UserProfile p) async {
    state = p;
    await _prefs.setString(_key, jsonEncode(p.toJson()));
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

  Scenario todayScenario() {
    final list = Catalog.forLang(state.learnLang);
    if (list.isEmpty) {
      return Catalog.forLang(LearnLang.en).first;
    }
    final idx = DateTime.now().day % list.length;
    return list[idx];
  }
}
