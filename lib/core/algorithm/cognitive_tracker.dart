/// Bilişsel mikro-sürtünme takibi.
///
/// Kart açılıp cevap verilene kadar geçen süreyi ölçer ve FSRS motoruna
/// "bu doğru cevap refleks mi, çaba gerektiren hatırlama mı, yoksa tahmin mi?"
/// bilgisini `memoryWeight` olarak verir. Hızlı ve doğru cevap hafızayı
/// güçlendirir; yavaş doğru cevap (tahmin) stabiliteyi hafifçe cezalandırır.
///
/// UI etiketleri i18n üzerinden yerelleştirilir; aşağıdaki `cognitiveLabel`
/// değerleri analitik/veri katmanı için kararlı kimliklerdir.
class CognitiveState {
  const CognitiveState(this.responseTime, this.isCorrect);

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
    switch (cognitiveLabel) {
      case 'Reflex':
        return 1.2;
      case 'Recall':
        return 1.0;
      default:
        return 0.8;
    }
  }
}

class CognitiveTracker {
  DateTime? _revealedAt;

  /// Cevap açıldığında (kullanıcı hedef metni gördüğünde) çağrılır.
  void onCardRevealed(DateTime now) {
    _revealedAt = now;
  }

  /// Kullanıcı cevapladığında çağrılır; `now` Clock üzerinden gelir
  /// (testlerde FakeClock ile deterministik).
  CognitiveState onAnswered(bool isCorrect, DateTime now) {
    final revealed = _revealedAt;
    final elapsed = revealed == null
        ? Duration.zero
        : (now.difference(revealed) >= Duration.zero
            ? now.difference(revealed)
            : Duration.zero);
    _revealedAt = null;
    return CognitiveState(elapsed, isCorrect);
  }
}
