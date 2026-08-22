import '../utils/clock.dart';

/// Bilişsel yanıt durumu: hız + doğruluk → "Refleks / Hatırlama / Tahmin / Hata".
class CognitiveState {
  CognitiveState(this.responseTime, this.isCorrect);

  final Duration responseTime;
  final bool isCorrect;

  String get cognitiveLabel {
    if (!isCorrect) return 'Lapse';
    if (responseTime.inMilliseconds < 1500) return 'Reflex';
    if (responseTime.inMilliseconds < 5000) return 'Recall';
    return 'Guess';
  }

  double get memoryWeight {
    if (!isCorrect) return 0.2;
    if (cognitiveLabel == 'Reflex') return 1.2;
    if (cognitiveLabel == 'Recall') return 1.0;
    return 0.8;
  }
}

/// Kart gösterimi ile cevap arasındaki süreyi ölçer.
/// FSRS'ye "tahmin mi, refleks mi?" bilgisi verir (memoryWeight).
class CognitiveTracker {
  CognitiveTracker({Clock? clock}) : _clock = clock ?? const SystemClock();

  final Clock _clock;
  DateTime? _revealedAt;

  void onCardRevealed() => _revealedAt = _clock.now();

  CognitiveState onAnswered(bool isCorrect) {
    final now = _clock.now();
    final elapsed = _revealedAt != null ? now.difference(_revealedAt!) : Duration.zero;
    return CognitiveState(elapsed, isCorrect);
  }
}
