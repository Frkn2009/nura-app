import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Hassas veriler (token, refresh token vb.) için şifreli depolama.
///
/// - Android: EncryptedSharedPreferences (minSdk 23 → `android/app/build.gradle.kts`
///   ile uyumlu; Android 6.0+ cihazlarda şifreli çalışır).
/// - iOS: Keychain (ilk kilit açılışından sonra erişilebilir).
///
/// Normal `SharedPreferences`'in aksine root/jailbreak'li cihazda düz metin
/// okunamaz. Supabase girişi aktifleştirildiğinde tokenlar burada tutulur.
class SecureStorage {
  SecureStorage._();

  static final SecureStorage instance = SecureStorage._();

  static const _accessTokenKey = 'nura.access_token';
  static const _refreshTokenKey = 'nura.refresh_token';

  final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    await _storage.write(key: _accessTokenKey, value: access);
    await _storage.write(key: _refreshTokenKey, value: refresh);
  }

  Future<String?> getAccessToken() => _storage.read(key: _accessTokenKey);

  Future<String?> getRefreshToken() => _storage.read(key: _refreshTokenKey);

  Future<void> clearAll() => _storage.deleteAll();
}
