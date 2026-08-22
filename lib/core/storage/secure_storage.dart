import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Şifreli anahtar deposu (Android Keystore / iOS Keychain).
///
/// v1.4'te Supabase erişim token'larının ve ileride OAuth/RP token'larının
/// yeri. SharedPreferences'ta YASAK (Contract: hassas değerler yalnızca
/// bu sarmalayıcıdan geçer).
class SecureStorage {
  static const _accessKey = 'access_token';
  static const _refreshKey = 'refresh_token';

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    await _storage.write(key: _accessKey, value: access);
    await _storage.write(key: _refreshKey, value: refresh);
  }

  Future<String?> getAccessToken() => _storage.read(key: _accessKey);

  Future<String?> getRefreshToken() => _storage.read(key: _refreshKey);

  Future<void> setRaw(String key, String value) => _storage.write(
        key: key,
        value: value,
      );

  Future<String?> readRaw(String key) => _storage.read(key: key);

  Future<void> clearAll() => _storage.deleteAll();
}

final secureStorageProvider = Provider<SecureStorage>((ref) => SecureStorage());
