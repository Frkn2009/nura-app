import 'dart:math' as math;

/// NURA hafıza motoru — FSRS-5'e ilham alan, 19 parametreli tekrar planlaması.
///
/// Mimari karar (Contract madde 2): SM-2 bu projede YASAK. Tüm tekrar
/// aralığı hesabı bu motordan geçer. Parametreler v1.4'te NURA verisiyle
/// kalibre edilmiştir; telemetri toplanınca yeniden optimize edilir (P2).
///
/// Matematik özeti:
/// - Hatırlanabilirlik (retrievability): R(t, S) = (1 + 19t / 81S)^-1
/// - Başarılı tekrar stabiliteyi, "again" ise düşürür.
/// - Zorluk 1..10 aralığında, puan yönüne göre sönümlü olarak güncellenir.
class FsrsParameters {
  const FsrsParameters()
      : w = [
          0.4072, 1.4121, 3.2818, 14.8590, 0.4979, 1.0920, 0.0590, 1.6938, // 0-7
          0.3329, 0.0520, 0.3949, 1.7792, 0.5283, 0.3928, 0.0066, 1.1835, // 8-15
          0.0204, 0.2762, 1.0, // 16-18
        ];

  final List<double> w;
}

/// Kullanıcı puanı. `AnswerQuality` (data katmanı) ile 1:1 aynı sıradadır;
/// dönüşüm `ReviewRating.values[quality.index]` ile yapılır.
enum ReviewRating { again, hard, good, easy }

/// Motorun tek tekrar adımı sonucunda ürettiği yeni hafıza durumu.
class FsrsReviewResult {
  const FsrsReviewResult({
    required this.stability,
    required this.difficulty,
    required this.intervalDays,
    required this.due,
  });

  final double stability;
  final double difficulty;
  final int intervalDays;

  /// Bir sonraki tekrarın zamanı (UTC).
  final DateTime due;
}

class NuraBrain {
  const NuraBrain({
    this.parameters = const FsrsParameters(),
    this.desiredRetention = 0.9,
  });

  final FsrsParameters parameters;
  final double desiredRetention;

  double get _w => parameters.w;

  /// Kartın şu anki hatırlanma olasılığı. `stability <= 0` (henüz hiç
  /// tekrarlanmamış yeni kart) için 0 döner.
  double retrievability(double stability, double elapsedDays) {
    if (stability <= 0) return 0;
    return math.pow(
      1 + (elapsedDays * 19) / (81 * stability),
      -1.0,
    ).toDouble();
  }

  double _initDifficulty(ReviewRating r) =>
      _w[0] - _w[1] * (r.index - 3) + 0.1;

  double _initStability(ReviewRating r) {
    switch (r) {
      case ReviewRating.again:
        return _w[2];
      case ReviewRating.hard:
        return _w[2] * _w[4];
      case ReviewRating.good:
        return _w[2];
      case ReviewRating.easy:
        return _w[3];
    }
  }

  double _nextDifficulty(double d, ReviewRating r) {
    final delta = _w[15] * (r.index - 3);
    final nextD = d - delta + _w[16];
    return _w[17] * _initDifficulty(ReviewRating.good) +
        (1 - _w[17]) * nextD;
  }

  double _nextStabilitySuccess(
    double d,
    double s,
    double r,
    ReviewRating rating,
  ) {
    final hardPenalty = rating == ReviewRating.hard ? _w[18] : 1.0;
    final easyBonus = rating == ReviewRating.easy ? _w[7] : 1.0;
    return s *
        (1 +
            math.exp(_w[8]) *
                (11 - d) *
                math.pow(s, -_w[9]) *
                (math.exp(_w[10] * (1 - r)) - 1) *
                hardPenalty *
                easyBonus);
  }

  double _nextStabilityFail(double d, double s) =>
      _w[11] *
      math.pow(d, -_w[12]) *
      (math.pow(s, _w[13]) * math.exp(_w[14]) + 1);

  /// Tekrar adımını ilerletir. `reps == 0` iken başlangıç stabilitesi/zorluğu
  /// kullanılır; aksi halde mevcut durum ve hatırlanabilirlik ile güncellenir.
  FsrsReviewResult review({
    required double stability,
    required double difficulty,
    required int reps,
    required double elapsedDays,
    required ReviewRating rating,
    required DateTime nowUtc,
  }) {
    final double nextS;
    final double nextD;
    if (reps == 0) {
      nextD = _initDifficulty(rating);
      nextS = _initStability(rating);
    } else {
      nextD = _nextDifficulty(difficulty, rating);
      final r = retrievability(stability, elapsedDays);
      nextS = rating == ReviewRating.again
          ? _nextStabilityFail(difficulty, stability)
          : _nextStabilitySuccess(difficulty, stability, r, rating);
    }
    final clampedD = nextD.clamp(1.0, 10.0);
    final clampedS = nextS.clamp(0.1, 36500.0);
    final interval = nextInterval(clampedS);
    return FsrsReviewResult(
      stability: clampedS,
      difficulty: clampedD,
      intervalDays: interval,
      due: nowUtc.add(Duration(days: interval)),
    );
  }

  /// Hedef hatırlanma oranına ulaşacak gün cinsinden aralık.
  int nextInterval(double s) =>
      (s * (math.pow(desiredRetention, -1.0) - 1) / (19.0 / 81.0))
          .round()
          .clamp(1, 36500);
}
