import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/supabase_config.dart';
import '../data/ai_service.dart';
import '../data/supabase_ai_service.dart';
import '../domain/ai_feedback.dart';

/// AI servisi seçimi:
/// - Supabase anahtarları girilmişse gerçek Edge Function (LLM) kullanılır.
/// - Girilmemişse veya çalışma sırasında hata olursa [SupabaseAiService]
///   içindeki güvenli düşüş otomatik olarak offline AI'a geçer.
final aiServiceProvider = Provider<AiService>((ref) {
  return SupabaseAiService();
});

/// Anahtar girilmemişken tamamen offline kalmasını garanti eden salt okunur bilgi.
final aiOfflineProvider = Provider<bool>((ref) => !SupaConfig.isSet);

final dailySummaryProvider = FutureProvider.family<LessonSummary, DailySummaryParams>((ref, params) async {
  final ai = ref.read(aiServiceProvider);
  return ai.generateDailySummary(
    reviewedCount: params.reviewed,
    difficultCount: params.difficult,
    masteredCount: params.mastered,
    targetLanguage: params.lang,
    streakDays: params.streak,
  );
});

class DailySummaryParams {
  const DailySummaryParams({
    required this.reviewed,
    required this.difficult,
    required this.mastered,
    required this.lang,
    required this.streak,
  });

  final int reviewed;
  final int difficult;
  final int mastered;
  final String lang;
  final int streak;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailySummaryParams &&
          reviewed == other.reviewed &&
          difficult == other.difficult &&
          mastered == other.mastered &&
          lang == other.lang &&
          streak == other.streak;

  @override
  int get hashCode => Object.hash(reviewed, difficult, mastered, lang, streak);
}
