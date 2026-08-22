import 'package:flutter/foundation.dart';

/// Hassas veriler (token, refresh token vb.) için şifreli depolama.
///
/// - Android: EncryptedSharedPreferences (minSdk 23 → `android/app/build.gradle.kts`
///   ile uyumlu; dolap Android 6.0+ cihazlarda şifreli çalışır).
/// - iOS: Keychain (ilk kilit açılışından sonra erişilebilir).
///
/// Normal [SharedPreferences]'in aksine root/jailbreak'li cihazda düz metin
/// okunamaz. Supabase girişi aktifleştirildiğinde tokenlar burada tutulmalı.
///
/// NOT: `flutter_secure_storage` paketi henüz `flutter pub get` ile lock'a
/// eklenmedi (sandbox'ta ağ yok). CI'da `flutter pub get` çalıştırılıp
/// pubspec.yaml'daki yorum açılınca servis tamamen etkinleşir.
class SecureStorage {
  SecureStorage._();

  static final SecureStorage instance = SecureStorage._();

  static const _accessTokenKey = 'nura.access_token';
  static const _refreshTokenKey = 'nura.refresh_token';

  /// Paket yüklenene kadar boş implementasyon; arayüz aynı kalır.
  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    debugPrint(
      '[SecureStorage] hazır değil: flutter_secure_storage paketi eklenmedi '
      '($_accessTokenKey/$_refreshTokenKey)',
    );
  }

  Future<String?> getAccessToken() async => null;

  Future<String?> getRefreshToken() async => null;

  Future<void> clearAll() async {}
}
