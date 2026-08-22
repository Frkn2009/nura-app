import '../domain/ai_feedback.dart';

/// AI Servis arayüzü — gerçek API veya fake ile değiştirilebilir
abstract class AiService {
  /// Kullanıcının cevabını analiz et, geri bildirim ver
  Future<AiFeedback> generateSentenceFeedback({
    required String sourceText,
    required String userAnswer,
    required String targetLanguage,
    required String nativeLanguage,
  });

  /// Kullanıcı seviyesine göre yeni senaryo üret
  Future<AiScenario> generateScenario({
    required String topic,
    required String level,
    required String targetLanguage,
    required String nativeLanguage,
  });

  /// Günlük hafıza raporu çıkar
  Future<LessonSummary> generateDailySummary({
    required int reviewedCount,
    required int difficultCount,
    required int masteredCount,
    required String targetLanguage,
    required int streakDays,
  });
}
