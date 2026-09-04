import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/supabase_config.dart';
import '../domain/ai_feedback.dart';
import 'ai_service.dart';
import 'fake_ai_service.dart';

/// Anthropic Claude ile çalışan gerçek AI servis — üç katmanlı düşüş zinciri:
///
/// 1. Önce Supabase `ai-feedback` Edge Function'ı dener (`_callSupabase`) —
///    gerçek anahtar sunucuda barınır, istemci hiçbir zaman anahtar
///    taşımaz. Oturum açık ve fonksiyon deploy edilmişse bu her zaman
///    çalışır (bkz. `supabase/functions/ai-feedback/index.ts`).
/// 2. Olmazsa, `VOXELITH_ANTHROPIC_API_KEY` dart-define'ı girilmişse
///    doğrudan istemciden Anthropic'e bağlanır (eski yol, geriye dönük
///    uyumluluk için tutuluyor).
/// 3. İkisi de yoksa/başarısız olursa (ağ, zaman aşımı, kimlik doğrulama,
///    bozuk JSON) sessizce [FakeAiService]'e düşer. Bu servis asla
///    exception fırlatmaz; UI her zaman bir sonuç alır.
class ClaudeAiService implements AiService {
  ClaudeAiService({AiService? fallback}) : _fallback = fallback ?? FakeAiService();

  final AiService _fallback;

  static const String _apiKey = String.fromEnvironment(
    'VOXELITH_ANTHROPIC_API_KEY',
  );
  static const String _model = 'claude-sonnet-5';
  static const String _endpoint = 'https://api.anthropic.com/v1/messages';
  static const Duration _timeout = Duration(seconds: 25);

  /// Anahtar girilmiş mi ve platform `dart:io HttpClient` destekliyor mu?
  static bool get _enabled => !kIsWeb && _apiKey.isNotEmpty;

  /// `supabase/functions/ai-feedback` Edge Function'ını çağırır. Oturum
  /// yoksa, Supabase yapılandırılmamışsa veya fonksiyon henüz deploy
  /// edilmemişse (ya da başka bir sebeple başarısız olursa) sessizce
  /// `null` döner — çağıran taraf bir sonraki katmana düşer.
  /// `error` doluysa `data` her zaman null'dur ve tam tersi — çağıran taraf
  /// `error == 'plus_required'` durumunu sessizce yutup sahteye düşmek
  /// yerine kullanıcıya net bir Plus yönlendirmesi göstermek için ayrıca
  /// kontrol edebilsin diye ikisi ayrı tutuluyor.
  Future<({Map<String, dynamic>? data, String? error})> _callSupabase(
    String op,
    Map<String, dynamic> params,
  ) async {
    if (!SupaConfig.isSet) return (data: null, error: null);
    final client = Supabase.instance.client;
    if (client.auth.currentSession == null) return (data: null, error: null);
    try {
      final response = await client.functions
          .invoke('ai-feedback', body: {'op': op, ...params})
          .timeout(_timeout);
      final data = response.data;
      if (data is! Map) return (data: null, error: null);
      final error = data['error'];
      if (error is String) return (data: null, error: error);
      return (data: data.cast<String, dynamic>(), error: null);
    } catch (_) {
      return (data: null, error: null);
    }
  }

  /// Kullanıcı bir ödüllü reklamı sonuna kadar izleyip AdMob'dan gerçek
  /// ödülü aldıktan SONRA çağrılır (bkz. AiFeedbackScreen). Sunucuda
  /// bugünkü ai-feedback sınırını 1 artırır, günde en fazla 5 kez —
  /// [UserProfile.maxRewardedAdsPerDay] ile aynı sınır (bkz.
  /// supabase/functions/ai-feedback/index.ts -> AD_BONUS_MAX).
  ///
  /// Döner: yeni bonus sayısı (0-5) kazanıldıysa, `null` sunucuya
  /// ulaşılamadıysa/oturum yoksa, `-1` bugünkü 5 reklam sınırına zaten
  /// ulaşılmışsa.
  Future<int?> claimFeedbackAdBonus() async {
    final remote = await _callSupabase('claim_ad_bonus', const {});
    if (remote.error == 'ad_bonus_limit_reached') return -1;
    final bonus = remote.data?['bonus'];
    return bonus is num ? bonus.toInt() : null;
  }

  // ---------------------------------------------------------------------
  // AiService
  // ---------------------------------------------------------------------

  @override
  Future<AiFeedback> generateSentenceFeedback({
    required String sourceText,
    required String userAnswer,
    required String targetLanguage,
    required String nativeLanguage,
  }) async {
    final remote = await _callSupabase('feedback', {
      'sourceText': sourceText,
      'userAnswer': userAnswer,
      'targetLanguage': targetLanguage,
      'nativeLanguage': nativeLanguage,
    });
    if (remote.error == 'plus_required') {
      // Ücretsiz kullanıcı günlük tadımlık hakkını kullandı — sessizce
      // sahteye düşmek yerine özelliğin gerçek olduğunu ve Plus'ta
      // sınırsız devam ettiğini gösteren net bir yönlendirme.
      return AiFeedback(
        userAnswer: userAnswer,
        correctedAnswer: sourceText,
        score: 0,
        tips: const [
          'Bugünkü ücretsiz AI analiz hakkını kullandın.',
          'Plus ile günde 15 kez sınırsız AI analizi alabilirsin.',
        ],
        encouragement: '🔒 Hay aksi, hakkın bitti! Yarın tekrar dene ya da Plus\'a geç',
      );
    }
    if (remote.error == 'daily_limit_reached') {
      // Plus kullanıcı günlük 15 hakkını doldurdu. Burada sessizce
      // FakeAiService'e düşmek, ödeme yapan kullanıcıya farkında olmadan
      // sahte bir AI cevabı göstermek anlamına gelirdi — bunun yerine
      // durumu açıkça bildiriyoruz (paywall'a yönlendirmiyoruz, zaten Plus).
      return AiFeedback(
        userAnswer: userAnswer,
        correctedAnswer: sourceText,
        score: 0,
        tips: const [
          'Bugünkü AI analiz hakkın (15/gün) doldu.',
          'Yarın aynı saatlerde sıfırlanır.',
        ],
        encouragement: '⏳ Yarın tekrar dene',
      );
    }
    final data = remote.data;
    if (data != null) {
      final tipsRaw = data['tips'];
      final tips = tipsRaw is List
          ? tipsRaw.map((e) => e.toString()).where((s) => s.isNotEmpty).toList()
          : <String>[];
      return AiFeedback(
        userAnswer: userAnswer,
        correctedAnswer:
            (data['correctedAnswer'] as Object?)?.toString() ?? sourceText,
        score: _asScore(data['score']),
        tips: tips.isEmpty ? ['Tekrar dene!'] : tips,
        encouragement: (data['encouragement'] as Object?)?.toString() ?? '',
      );
    }
    if (!_enabled) {
      return _fallback.generateSentenceFeedback(
        sourceText: sourceText,
        userAnswer: userAnswer,
        targetLanguage: targetLanguage,
        nativeLanguage: nativeLanguage,
      );
    }
    try {
      final system =
          'You are a supportive, precise language-learning coach for the '
          '"$targetLanguage" language. Given the expected sentence and the '
          "learner's answer, evaluate it and respond with STRICT JSON only "
          '(no markdown, no prose outside the JSON object) matching exactly '
          'this shape:\n'
          '{"score": <integer 0-100>, "correctedAnswer": <string, the '
          'ideal/corrected version of the expected sentence>, "tips": '
          '[<2 to 3 short actionable strings>], "encouragement": <one short '
          'upbeat string>}\n'
          'Write "correctedAnswer", "tips", and "encouragement" in the '
          'learner\'s UI language, which is "$nativeLanguage". Be honest but '
          'kind; score reflects grammatical and semantic closeness to the '
          'expected sentence, not just word overlap.';
      final user =
          'Expected sentence ($targetLanguage): "$sourceText"\n'
          'Learner\'s answer: "$userAnswer"';

      final json = await _callClaude(
        system: system,
        userPrompt: user,
        maxTokens: 1024,
      );

      final tipsRaw = json['tips'];
      final tips = tipsRaw is List
          ? tipsRaw.map((e) => e.toString()).where((s) => s.isNotEmpty).toList()
          : <String>[];

      return AiFeedback(
        userAnswer: userAnswer,
        correctedAnswer: (json['correctedAnswer'] as Object?)?.toString() ??
            sourceText,
        score: _asScore(json['score']),
        tips: tips.isEmpty ? ['Tekrar dene!'] : tips,
        encouragement: (json['encouragement'] as Object?)?.toString() ?? '',
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
    final remote = await _callSupabase('scenario', {
      'topic': topic,
      'level': level,
      'targetLanguage': targetLanguage,
      'nativeLanguage': nativeLanguage,
    });
    final data = remote.data;
    if (data != null) {
      final dialogueRaw = data['dialogue'];
      final dialogue = <AiDialogueLine>[];
      if (dialogueRaw is List) {
        for (final item in dialogueRaw) {
          if (item is Map) {
            dialogue.add(
              AiDialogueLine(
                speaker: (item['speaker'] as Object?)?.toString() ?? '',
                text: (item['text'] as Object?)?.toString() ?? '',
                translation:
                    (item['translation'] as Object?)?.toString() ?? '',
              ),
            );
          }
        }
      }
      final vocabRaw = data['vocabulary'];
      final vocabulary = <AiVocabItem>[];
      if (vocabRaw is List) {
        for (final item in vocabRaw) {
          if (item is Map) {
            vocabulary.add(
              AiVocabItem(
                word: (item['word'] as Object?)?.toString() ?? '',
                translation:
                    (item['translation'] as Object?)?.toString() ?? '',
                example: (item['example'] as Object?)?.toString() ?? '',
              ),
            );
          }
        }
      }
      if (dialogue.isNotEmpty && vocabulary.isNotEmpty) {
        return AiScenario(
          topic: topic,
          level: level,
          dialogue: dialogue,
          vocabulary: vocabulary,
        );
      }
    }
    if (!_enabled) {
      return _fallback.generateScenario(
        topic: topic,
        level: level,
        targetLanguage: targetLanguage,
        nativeLanguage: nativeLanguage,
      );
    }
    try {
      final system =
          'You are a language-learning content generator for the '
          '"$targetLanguage" language, CEFR level "$level". Respond with '
          'STRICT JSON only (no markdown, no prose outside the JSON object) '
          'matching exactly this shape:\n'
          '{"dialogue": [{"speaker": <string>, "text": <string, in '
          '$targetLanguage>, "translation": <string, in $nativeLanguage>}, '
          '... 3 to 6 lines total, alternating between a tutor character and '
          'the learner (use "Sen" / "You" placeholder text for the learner '
          'lines)], "vocabulary": [{"word": <string, in $targetLanguage>, '
          '"translation": <string, in $nativeLanguage>, "example": <string, '
          'an example sentence in $targetLanguage>}, ... 3 to 5 items]}\n'
          'Keep sentences short and appropriate for level "$level". Topic: '
          '"$topic".';
      final user = 'Generate the scenario now.';

      final json = await _callClaude(
        system: system,
        userPrompt: user,
        maxTokens: 1536,
      );

      final dialogueRaw = json['dialogue'];
      final dialogue = <AiDialogueLine>[];
      if (dialogueRaw is List) {
        for (final item in dialogueRaw) {
          if (item is Map) {
            dialogue.add(
              AiDialogueLine(
                speaker: (item['speaker'] as Object?)?.toString() ?? '',
                text: (item['text'] as Object?)?.toString() ?? '',
                translation:
                    (item['translation'] as Object?)?.toString() ?? '',
              ),
            );
          }
        }
      }

      final vocabRaw = json['vocabulary'];
      final vocabulary = <AiVocabItem>[];
      if (vocabRaw is List) {
        for (final item in vocabRaw) {
          if (item is Map) {
            vocabulary.add(
              AiVocabItem(
                word: (item['word'] as Object?)?.toString() ?? '',
                translation:
                    (item['translation'] as Object?)?.toString() ?? '',
                example: (item['example'] as Object?)?.toString() ?? '',
              ),
            );
          }
        }
      }

      if (dialogue.isEmpty || vocabulary.isEmpty) {
        throw const FormatException('Claude scenario response incomplete');
      }

      return AiScenario(
        topic: topic,
        level: level,
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
    final remote = await _callSupabase('summary', {
      'targetLanguage': targetLanguage,
      'reviewedCount': reviewedCount,
      'difficultCount': difficultCount,
      'masteredCount': masteredCount,
      'streakDays': streakDays,
    });
    final data = remote.data;
    if (data != null) {
      final message = (data['message'] as Object?)?.toString();
      if (message != null && message.isNotEmpty) {
        return LessonSummary(
          reviewedCount: reviewedCount,
          masteredCount: masteredCount,
          difficultWords: const [],
          message: message,
          streakDays: streakDays,
        );
      }
    }
    if (!_enabled) {
      return _fallback.generateDailySummary(
        reviewedCount: reviewedCount,
        difficultCount: difficultCount,
        masteredCount: masteredCount,
        targetLanguage: targetLanguage,
        streakDays: streakDays,
      );
    }
    try {
      final system =
          'You are an encouraging language-learning coach. Given a '
          "learner's daily practice stats for $targetLanguage, respond with "
          'STRICT JSON only (no markdown, no prose outside the JSON object) '
          'matching exactly this shape:\n'
          '{"message": <one short upbeat summary string, written in the '
          'same language as the stats context, celebrating progress and '
          'gently nudging further practice>}\n'
          'Do not invent specific vocabulary words — you were not given '
          'any, only counts.';
      final user =
          'reviewedCount=$reviewedCount, difficultCount=$difficultCount, '
          'masteredCount=$masteredCount, streakDays=$streakDays';

      final json = await _callClaude(
        system: system,
        userPrompt: user,
        maxTokens: 512,
      );

      final message = (json['message'] as Object?)?.toString();
      if (message == null || message.isEmpty) {
        throw const FormatException('Claude summary response incomplete');
      }

      return LessonSummary(
        reviewedCount: reviewedCount,
        masteredCount: masteredCount,
        difficultWords: const [],
        message: message,
        streakDays: streakDays,
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

  // ---------------------------------------------------------------------
  // HTTP + JSON plumbing
  // ---------------------------------------------------------------------

  static int _asScore(Object? raw) {
    final n = raw is num ? raw.toInt() : int.tryParse('$raw') ?? 0;
    return n.clamp(0, 100).toInt();
  }

  /// Anthropic Messages API'ye tek bir istek atar, ilk metin bloğunu alır ve
  /// içindeki JSON nesnesini döner. Ağ/zaman aşımı/HTTP/parse hatalarında
  /// exception fırlatır — çağıran taraf bunu yakalayıp fake'e düşer.
  Future<Map<String, dynamic>> _callClaude({
    required String system,
    required String userPrompt,
    required int maxTokens,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = _timeout;
    try {
      final request = await client
          .postUrl(Uri.parse(_endpoint))
          .timeout(_timeout);
      request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
      request.headers.set('x-api-key', _apiKey);
      request.headers.set('anthropic-version', '2023-06-01');

      final bodyJson = jsonEncode({
        'model': _model,
        'max_tokens': maxTokens,
        'system': system,
        'output_config': {'effort': 'low'},
        'messages': [
          {'role': 'user', 'content': userPrompt},
        ],
      });
      request.add(utf8.encode(bodyJson));

      final response = await request.close().timeout(_timeout);
      final responseBody = await response
          .transform(utf8.decoder)
          .join()
          .timeout(_timeout);

      if (response.statusCode != 200) {
        throw HttpException(
          'Claude API HTTP ${response.statusCode}: $responseBody',
        );
      }

      final decoded = jsonDecode(responseBody);
      if (decoded is! Map<String, dynamic>) {
        throw const FormatException('Unexpected Claude response shape');
      }
      final content = decoded['content'];
      if (content is! List) {
        throw const FormatException('Claude response missing content[]');
      }
      String? text;
      for (final block in content) {
        if (block is Map && block['type'] == 'text') {
          text = block['text'] as String?;
          break;
        }
      }
      if (text == null || text.isEmpty) {
        throw const FormatException('Claude response has no text block');
      }
      return _extractJsonObject(text);
    } finally {
      client.close(force: true);
    }
  }

  /// Modelin bazen kod bloğuna ("```json ... ```") ya da açıklama metnine
  /// sardığı JSON'u savunmacı biçimde çıkarır.
  Map<String, dynamic> _extractJsonObject(String rawText) {
    var s = rawText.trim();
    if (s.startsWith('```')) {
      final firstNewline = s.indexOf('\n');
      if (firstNewline != -1) s = s.substring(firstNewline + 1);
      if (s.endsWith('```')) s = s.substring(0, s.length - 3);
      s = s.trim();
    }
    final start = s.indexOf('{');
    final end = s.lastIndexOf('}');
    if (start == -1 || end == -1 || end < start) {
      throw const FormatException('No JSON object found in Claude text');
    }
    final jsonStr = s.substring(start, end + 1);
    final parsed = jsonDecode(jsonStr);
    if (parsed is! Map<String, dynamic>) {
      throw const FormatException('Claude JSON is not an object');
    }
    return parsed;
  }
}
