import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/supabase_config.dart';
import '../domain/ai_feedback.dart';
import 'ai_service.dart';
import 'fake_ai_service.dart';

/// Supabase Edge Function üzerinden gerçek LLM'e bağlanan AI servisi.
///
/// - Sunucu anahtarı (OPENAI_API_KEY) istemcide değil, yalnızca sunucuda tutulur.
/// - Herhangi bir hata (sunucu kapalı, anahtar yok, network, timeout) durumunda
///   otomatik olarak offline [FakeAiService]'e düşer → kullanıcı asla boş ekran
///   görmez, uygulama asla çökmez.
class SupabaseAiService implements AiService {
  SupabaseAiService({AiService? fallback}) : _fallback = fallback ?? FakeAiService();

  final AiService _fallback;

  static const String _functionName = 'ai';

  bool get _available =>
      SupaConfig.isSet &&
      Supabase.instance.client.auth.currentSession != null;

  /// Edge Function'ı çağırır. [action] yoksa [AiAction] ayrımı payload içinde.
  Future<Map<String, dynamic>> _invoke(String action, Map<String, dynamic> body) async {
    if (!_available) {
      throw const SupabaseAiUnavailable('service_not_configured');
    }
    final response = await Supabase.instance.client.functions
        .invoke(_functionName, body: {...body, 'action': action});
    final data = response.data;
    if (data is! Map) {
      throw const SupabaseAiUnavailable('invalid_response');
    }
    final error = data['error'];
    if (error is String) {
      throw SupabaseAiUnavailable(error);
    }
    return data.cast<String, dynamic>();
  }

  @override
  Future<AiFeedback> generateSentenceFeedback({
    required String sourceText,
    required String userAnswer,
    required String targetLanguage,
    required String nativeLanguage,
  }) async {
    try {
      final data = await _invoke('feedback', {
        'sourceText': sourceText,
        'userAnswer': userAnswer,
        'targetLanguage': targetLanguage,
        'nativeLanguage': nativeLanguage,
      });
      return AiFeedback(
        userAnswer: userAnswer,
        correctedAnswer: _str(data['correctedAnswer']) ?? sourceText,
        score: _int(data['score'], 50).clamp(0, 100),
        tips: _strList(data['tips']),
        encouragement:
            _str(data['encouragement']) ?? 'Harika ilerliyorsun, devam et!',
      );
    } catch (_) {
      return _fallback.generateSentenceFeedback(
        sourceText: sourceText,
        userAnswer: userAnswer,
        targetLanguage: targetLanguage,
        nativeLanguage: nativeLanguage,
      );
    }
  }

  @override
  Future<AiScenario> generateScenario({
    required String topic,
    required String level,
    required String targetLanguage,
    required String nativeLanguage,
  }) async {
    try {
      final data = await _invoke('scenario', {
        'topic': topic,
        'level': level,
        'targetLanguage': targetLanguage,
        'nativeLanguage': nativeLanguage,
      });
      final dialogue = (data['dialogue'] is List)
          ? (data['dialogue'] as List).map((item) {
              final map = (item as Map).cast<String, dynamic>();
              return AiDialogueLine(
                speaker: _str(map['speaker']) ?? 'Maya',
                text: _str(map['text']) ?? '',
                translation: _str(map['translation']) ?? '',
              );
            }).where((line) => line.text.isNotEmpty).toList()
          : <AiDialogueLine>[];
      final vocabulary = (data['vocabulary'] is List)
          ? (data['vocabulary'] as List).map((item) {
              final map = (item as Map).cast<String, dynamic>();
              return AiVocabItem(
                word: _str(map['word']) ?? '',
                translation: _str(map['translation']) ?? '',
                example: _str(map['example']) ?? '',
              );
            }).where((item) => item.word.isNotEmpty).toList()
          : <AiVocabItem>[];
      if (dialogue.isEmpty) throw const SupabaseAiUnavailable('empty_scenario');
      return AiScenario(
        topic: _str(data['topic']) ?? topic,
        level: _str(data['level']) ?? level,
        dialogue: dialogue,
        vocabulary: vocabulary,
      );
    } catch (_) {
      return _fallback.generateScenario(
        topic: topic,
        level: level,
        targetLanguage: targetLanguage,
        nativeLanguage: nativeLanguage,
      );
    }
  }

  @override
  Future<LessonSummary> generateDailySummary({
    required int reviewedCount,
    required int difficultCount,
    required int masteredCount,
    required String targetLanguage,
    required int streakDays,
  }) async {
    try {
      final data = await _invoke('summary', {
        'reviewedCount': reviewedCount,
        'difficultCount': difficultCount,
        'masteredCount': masteredCount,
        'targetLanguage': targetLanguage,
        'streakDays': streakDays,
      });
      return LessonSummary(
        reviewedCount: _int(data['reviewedCount'], reviewedCount),
        masteredCount: _int(data['masteredCount'], masteredCount),
        difficultWords: _strList(data['difficultWords']),
        message: _str(data['message']) ?? 'Bugün de güzel ilerleme kaydettin!',
        streakDays: _int(data['streakDays'], streakDays),
      );
    } catch (_) {
      return _fallback.generateDailySummary(
        reviewedCount: reviewedCount,
        difficultCount: difficultCount,
        masteredCount: masteredCount,
        targetLanguage: targetLanguage,
        streakDays: streakDays,
      );
    }
  }

  String? _str(Object? value) =>
      value is String && value.trim().isNotEmpty ? value.trim() : null;

  int _int(Object? value, int fallback) =>
      value is int ? value : (value is num ? value.round() : fallback);

  List<String> _strList(Object? value) {
    if (value is! List) return const [];
    return value
        .whereType<String>()
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .toList();
  }
}

class SupabaseAiUnavailable implements Exception {
  const SupabaseAiUnavailable(this.code);
  final String code;

  @override
  String toString() => code;
}
