import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/supabase_config.dart';
import '../models/models.dart';
import 'cloud_translate.dart';

/// Toplantı Çevirmeni'nin çeviri çağrısı — `interpreter-translate` fonksiyonu
/// `translate`'in aksine abonelik şartı koşmaz (kota istemci tarafında
/// [UserProfile.interpreterSecondsLeft] ile tutulur), sadece geçerli bir
/// Supabase oturumu ister.
class InterpreterTranslate {
  static Future<String> translate({
    required String input,
    required LearnLang from,
    required LearnLang to,
  }) async {
    if (!SupaConfig.isSet) {
      throw const CloudTranslationException('service_not_configured');
    }
    final client = Supabase.instance.client;
    if (client.auth.currentSession == null) {
      throw const CloudTranslationException('authentication_required');
    }

    final response = await client.functions.invoke(
      'interpreter-translate',
      body: {'text': input, 'from': from.code, 'to': to.code},
    );
    final data = response.data;
    if (data is! Map) {
      throw const CloudTranslationException('invalid_response');
    }
    final error = data['error'];
    if (error is String) throw CloudTranslationException(error);
    final translated = data['translatedText'];
    if (translated is! String || translated.trim().isEmpty) {
      throw const CloudTranslationException('invalid_response');
    }
    return translated.trim();
  }
}
