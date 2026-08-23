import '../domain/ai_feedback.dart';
import 'ai_service.dart';

/// Offline çalışan sahte AI — API bağlanana kadar kullanılır
class FakeAiService implements AiService {
  @override
  Future<AiFeedback> generateSentenceFeedback({
    required String sourceText,
    required String userAnswer,
    required String targetLanguage,
    required String nativeLanguage,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final source = sourceText.toLowerCase().trim();
    final answer = userAnswer.toLowerCase().trim();

    // Basit benzerlik skoru
    final sourceWords = source.split(RegExp(r'\s+'));
    final answerWords = answer.split(RegExp(r'\s+'));
    int matches = 0;
    for (final w in sourceWords) {
      if (w.length > 2 &&
          answerWords.any((a) => a.contains(w) || w.contains(a))) {
        matches++;
      }
    }
    final score = sourceWords.isEmpty
        ? 50
        : (60 + (matches * 40 / sourceWords.length)).round().clamp(30, 98);

    final tips = <String>[];
    if (score < 60) {
      tips.add('Cümleyi yavaşça tekrar dinle ve kelime kelime takip et.');
      tips.add('Önce ana fiili bul, sonra cümleyi kur.');
    } else if (score < 80) {
      tips.add('İyi gidiyorsun! Kelime sırasına dikkat et.');
      tips.add('Telaffuzu daha yavaş tekrarla.');
    } else {
      tips.add('Harika! Neredeyse mükemmel.');
    }

    final encouragement = score >= 80
        ? '🌟 Muhteşem! Devam et!'
        : score >= 60
        ? '💪 İyi çalışıyorsun, biraz daha pratik!'
        : '🎯 Endişelenme, tekrar güçlendirir!';

    return AiFeedback(
      userAnswer: userAnswer,
      correctedAnswer: sourceText,
      score: score,
      tips: tips,
      encouragement: encouragement,
    );
  }

  @override
  Future<AiScenario> generateScenario({
    required String topic,
    required String level,
    required String targetLanguage,
    required String nativeLanguage,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return AiScenario(
      topic: topic,
      level: level,
      dialogue: [
        AiDialogueLine(
          speaker: 'Maya',
          text: 'Merhaba! Bugün $topic hakkında konuşalım.',
          translation: 'Hello! Let\'s talk about $topic today.',
        ),
        AiDialogueLine(
          speaker: 'Sen',
          text: '...',
          translation: '(Senin cevabın)',
        ),
        AiDialogueLine(
          speaker: 'Maya',
          text: 'Harika! Şimdi bir cümle kur.',
          translation: 'Great! Now build a sentence.',
        ),
      ],
      vocabulary: [
        AiVocabItem(
          word: topic,
          translation: topic,
          example: '$topic ile ilgili örnek cümle',
        ),
      ],
    );
  }

  @override
  Future<LessonSummary> generateDailySummary({
    required int reviewedCount,
    required int difficultCount,
    required int masteredCount,
    required String targetLanguage,
    required int streakDays,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final difficult = <String>[];
    if (difficultCount > 0) {
      difficult.addAll(['zorlu kelime 1', 'zorlu kelime 2']);
    }

    String message;
    if (streakDays >= 7) {
      message =
          '🔥 $streakDays gün seri! Muhteşem disiplin. $masteredCount kelime artık senin.';
    } else if (reviewedCount > 10) {
      message =
          '📚 Bugün $reviewedCount tekrar yaptın. $masteredCount kelime güçlendi.';
    } else if (reviewedCount > 0) {
      message = '✨ Güzel başlangıç! Her gün biraz daha.';
    } else {
      message = '⏰ Bugün henüz pratik yapmadın. Hadi 5 dakika ayır!';
    }

    return LessonSummary(
      reviewedCount: reviewedCount,
      masteredCount: masteredCount,
      difficultWords: difficult,
      message: message,
      streakDays: streakDays,
    );
  }
}
