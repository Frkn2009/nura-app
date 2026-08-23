import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/supabase_config.dart';

class LiveChatException implements Exception {
  const LiveChatException(this.code);
  final String code;

  @override
  String toString() => code;
}

class ChatTurn {
  const ChatTurn({required this.role, required this.text});
  final String role; // 'user' | 'ai'
  final String text;

  Map<String, String> toJson() => {'role': role, 'text': text};
}

/// Canlı AI konuşma partneri — güvenli Supabase Edge Function üzerinden.
/// Sunucu tarafında Plus doğrulaması ve gerçek LLM anahtarı barındırılır.
class LiveChatService {
  static Future<String> reply({
    required String message,
    required String targetLanguage,
    required String nativeLanguage,
    required String level,
    List<ChatTurn> history = const [],
  }) async {
    if (!SupaConfig.isSet) {
      throw const LiveChatException('service_not_configured');
    }
    final client = Supabase.instance.client;
    if (client.auth.currentSession == null) {
      throw const LiveChatException('authentication_required');
    }

    final response = await client.functions.invoke(
      'chat',
      body: {
        'message': message,
        'targetLanguage': targetLanguage,
        'nativeLanguage': nativeLanguage,
        'level': level,
        'history': history.map((t) => t.toJson()).toList(),
      },
    );
    final data = response.data;
    if (data is! Map) throw const LiveChatException('invalid_response');
    final error = data['error'];
    if (error is String) throw LiveChatException(error);
    final reply = data['reply'];
    if (reply is! String || reply.trim().isEmpty) {
      throw const LiveChatException('invalid_response');
    }
    return reply.trim();
  }
}
