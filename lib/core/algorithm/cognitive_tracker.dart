/// Bilişsel Takip — cevap verme süresini ölçer.
/// FSRS'ye "Tahmin mi, Refleks mi?" bilgisi verir.
class CognitiveState {
  final Duration responseTime;
  final bool isCorrect;

  CognitiveState(this.responseTime, this.isCorrect);

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

class CognitiveTracker {
  DateTime? _revealedAt;

  void onCardRevealed() => _revealedAt = DateTime.now();

  CognitiveState onAnswered(bool isCorrect) {
    final now = DateTime.now();
    return CognitiveState(
      _revealedAt != null ? now.difference(_revealedAt!) : Duration.zero,
      isCorrect,
    );
  }
}
