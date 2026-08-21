import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/supabase_config.dart';
import '../models/models.dart';
import 'offline_translate.dart';

class CloudTranslationException implements Exception {
  const CloudTranslationException(this.code);
  final String code;

  @override
  String toString() => code;
}

/// Plus çevirisini güvenli Supabase Edge Function üzerinden çağırır.
class CloudTranslate {
  static Future<TranslationHit> translate({
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
      'translate',
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

    return TranslationHit(
      source: input.trim(),
      target: translated.trim(),
      gloss: 'Google Cloud Translation',
      confidence: .9,
      origin: TranslationOrigin.cloud,
    );
  }
}
