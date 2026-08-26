import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/supabase_config.dart';
import '../models/clan.dart';
import '../models/leaderboard.dart';
import '../models/models.dart';

/// VOXELO — Supabase ile tek konuşan katman.
/// Anahtarlar girilmediyse (Supa.enabled == false) hiçbir şey yapmaz.
class Supa {
  static bool get enabled => SupaConfig.isSet;
  static SupabaseClient get _c => Supabase.instance.client;

  static String? get currentEmail {
    if (!enabled) return null;
    return _c.auth.currentUser?.email;
  }

  // ---------- AUTH ----------

  /// Kayıt ol. E-posta doğrulaması açıksa session gelmez;
  /// dönüş false ise kullanıcıya "mailine link gitti" göster.
  static Future<bool> signUp(String email, String pass) async {
    final res = await _c.auth.signUp(email: email.trim(), password: pass);
    return res.session != null;
  }

  static Future<void> signIn(String email, String pass) async {
    await _c.auth.signInWithPassword(email: email.trim(), password: pass);
  }

  static Future<void> signOut() async {
    await _c.auth.signOut();
  }

  // ---------- XP / HAFTALIK SIRALAMA ----------

  static Future<void> recordXp(int amount, String source) async {
    if (!enabled || _c.auth.currentUser == null || amount <= 0) return;
    await _c.rpc('record_xp', params: {'p_amount': amount, 'p_source': source});
  }

  /// Haftanın ilk 10'unu ve kullanıcı ilk 10 dışında olsa da kendi satırını alır.
  static Future<List<LeaderboardEntry>> weeklyLeaderboard() async {
    if (!enabled || _c.auth.currentUser == null) return const [];
    final response = await _c.rpc(
      'get_weekly_leaderboard',
      params: {'p_limit': 10},
    );
    final rows = response as List<dynamic>;
    return rows
        .cast<Map<String, dynamic>>()
        .map(LeaderboardEntry.fromJson)
        .toList(growable: false);
  }

  /// Sunucudaki hesabı komple siler (profiles satırı + auth kaydı).
  /// `delete_my_account` fonksiyonu supabase_setup.sql ile oluşturulur.
  static Future<void> deleteAccount() async {
    await _c.rpc('delete_my_account');
    await _c.auth.signOut();
  }

  // ---------- TAKIM / CLAN ----------

  static Future<List<ClanMemberEntry>> myClan() async {
    if (!enabled || _c.auth.currentUser == null) return const [];
    final response = await _c.rpc('get_my_clan');
    return (response as List)
        .map(
          (row) =>
              ClanMemberEntry.fromJson(Map<String, dynamic>.from(row as Map)),
        )
        .toList(growable: false);
  }

  static Future<void> createClan(String name) async {
    await _c.rpc('create_clan', params: {'p_name': name.trim()});
  }

  static Future<void> joinClan(String code) async {
    await _c.rpc('join_clan', params: {'p_code': code.trim().toUpperCase()});
  }

  static Future<void> leaveClan() async {
    await _c.rpc('leave_clan');
  }

  static Future<List<ClanChatMessage>> clanMessages({int limit = 50}) async {
    if (!enabled || _c.auth.currentUser == null) return const [];
    final response = await _c.rpc(
      'get_clan_messages',
      params: {'p_limit': limit},
    );
    return (response as List)
        .map(
          (row) =>
              ClanChatMessage.fromJson(Map<String, dynamic>.from(row as Map)),
        )
        .toList(growable: false)
        .reversed
        .toList(growable: false);
  }

  static Future<void> sendClanMessage(String text) async {
    final clean = text.trim();
    if (!enabled || _c.auth.currentUser == null || clean.isEmpty) return;
    final clan = await _c.rpc('get_my_clan');
    final rows = clan as List;
    if (rows.isEmpty) return;
    final clanId = (rows.first as Map)['clan_id'];
    await _c.from('clan_messages').insert({
      'clan_id': clanId,
      'user_id': _c.auth.currentUser!.id,
      'text': clean,
    });
  }

  // ---------- PROFİL ----------

  /// Yerel profili `profiles` tablosuna yazar (varsa günceller).
  static Future<void> pushProfile(UserProfile p) async {
    if (!enabled) return;
    final uid = _c.auth.currentUser?.id;
    if (uid == null) return;
    await _c.from('profiles').upsert({
      'user_id': uid,
      'ui_lang': p.uiLang.name,
      'learn_lang': p.learnLang.name,
      'motive': p.motive.name,
      'cefr': p.cefr.name,
      'daily_goal_min': p.dailyGoalMin,
      'onboarded': p.onboarded,
      'is_plus': p.isPlus,
      'streak': p.streak,
      'last_practice_day_key': p.lastPracticeDayKey,
      'total_xp': p.totalXp,
      'daily_xp': p.dailyXp,
      'xp_day_key': p.xpDayKey,
      'completed_scenes': p.completedScenes,
      'games_completed': p.gamesCompleted,
      'completed_languages': p.completedLanguages
          .map((language) => language.name)
          .toList(),
      'achievements': p.achievements
          .map((achievement) => achievement.name)
          .toList(),
      'notifications_enabled': p.notificationsEnabled,
      'reminder_hour': p.reminderHour,
      'theme_preference': p.themePreference.name,
      'phrases_known': p.phrasesKnown,
      'speak_seconds_used': p.speakSecondsUsed,
      'speak_day_key': p.speakDayKey,
      'bonus_speak_seconds': p.bonusSpeakSeconds,
      'ads_watched_today': p.adsWatchedToday,
      'last_ad_epoch': p.lastAdEpoch,
      'joined_event_id': p.joinedEventId,
      'learned_ids': p.learnedIds.toList(),
      'srs': p.srs,
      'updated_at': DateTime.now().toIso8601String(),
    }, onConflict: 'user_id');
  }

  /// Buluttaki profili getir. Satır yoksa null.
  static Future<void> pushFamilyProfile(UserProfile profile) async {
    if (!enabled) return;
    final uid = _c.auth.currentUser?.id;
    if (uid == null) return;
    await _c.from('family_profiles').upsert({
      'user_id': uid,
      'profile_id': profile.profileId,
      'profile_name': profile.profileName,
      'profile_data': profile.toJson(),
      'updated_at': DateTime.now().toIso8601String(),
    }, onConflict: 'user_id,profile_id');
  }

  static Future<List<UserProfile>> pullFamilyProfiles() async {
    if (!enabled || _c.auth.currentUser == null) return const [];
    final rows = await _c.from('family_profiles').select('profile_data');
    return (rows as List)
        .map(
          (row) => UserProfile.fromJson(
            Map<String, dynamic>.from(row['profile_data'] as Map),
          ),
        )
        .toList(growable: false);
  }

  static Future<UserProfile?> pullProfile() async {
    if (!enabled) return null;
    final uid = _c.auth.currentUser?.id;
    if (uid == null) return null;
    final row = await _c
        .from('profiles')
        .select()
        .eq('user_id', uid)
        .maybeSingle();
    if (row == null) return null;
    return UserProfile.fromJson({
      'uiLang': row['ui_lang'],
      'learnLang': row['learn_lang'],
      'motive': row['motive'],
      'cefr': row['cefr'],
      'dailyGoalMin': row['daily_goal_min'],
      'onboarded': row['onboarded'],
      'isPlus': row['is_plus'],
      'streak': row['streak'],
      'lastPracticeDayKey': row['last_practice_day_key'],
      'totalXp': row['total_xp'],
      'dailyXp': row['daily_xp'],
      'xpDayKey': row['xp_day_key'],
      'completedScenes': row['completed_scenes'],
      'gamesCompleted': row['games_completed'],
      'completedLanguages': row['completed_languages'],
      'achievements': row['achievements'],
      'notificationsEnabled': row['notifications_enabled'],
      'reminderHour': row['reminder_hour'],
      'themePreference': row['theme_preference'],
      'phrasesKnown': row['phrases_known'],
      'speakSecondsUsed': row['speak_seconds_used'],
      'speakDayKey': row['speak_day_key'],
      'bonusSpeakSeconds': row['bonus_speak_seconds'],
      'adsWatchedToday': row['ads_watched_today'],
      'lastAdEpoch': row['last_ad_epoch'],
      'joinedEventId': row['joined_event_id'],
      'learnedIds': row['learned_ids'],
      'srs': row['srs'],
    });
  }
}

/// Giriş yapan kullanıcının e-postası. null = giriş yok (veya anahtar yok).
final authEmailProvider = NotifierProvider<AuthEmail, String?>(AuthEmail.new);

class AuthEmail extends Notifier<String?> {
  @override
  String? build() {
    if (!Supa.enabled) return null;
    final sub = Supa._c.auth.onAuthStateChange.listen((data) {
      state = data.session?.user.email;
    });
    ref.onDispose(sub.cancel);
    return Supa.currentEmail;
  }

  Future<void> logout() async {
    await Supa.signOut();
    state = null;
  }
}
