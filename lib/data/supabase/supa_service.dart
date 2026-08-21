import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/supabase_config.dart';
import '../models/models.dart';

/// NURA — Supabase ile tek konuşan katman.
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

  /// Sunucudaki hesabı komple siler (profiles satırı + auth kaydı).
  /// `delete_my_account` fonksiyonu supabase_setup.sql ile oluşturulur.
  static Future<void> deleteAccount() async {
    await _c.rpc('delete_my_account');
    await _c.auth.signOut();
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
      'phrases_known': p.phrasesKnown,
      'speak_seconds_used': p.speakSecondsUsed,
      'speak_day_key': p.speakDayKey,
      'bonus_speak_seconds': p.bonusSpeakSeconds,
      'ads_watched_today': p.adsWatchedToday,
      'learned_ids': p.learnedIds.toList(),
      'srs': p.srs,
      'updated_at': DateTime.now().toIso8601String(),
    }, onConflict: 'user_id');
  }

  /// Buluttaki profili getir. Satır yoksa null.
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
      'phrasesKnown': row['phrases_known'],
      'speakSecondsUsed': row['speak_seconds_used'],
      'speakDayKey': row['speak_day_key'],
      'bonusSpeakSeconds': row['bonus_speak_seconds'],
      'adsWatchedToday': row['ads_watched_today'],
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
