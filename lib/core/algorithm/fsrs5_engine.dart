import 'dart:math';

class FsrsParameters {
  final List<double> w;
  FsrsParameters()
      : w = [
          0.4072, 1.4121, 3.2818, 14.8590, 0.4979, 1.0920, 0.0590, 1.6938,
          0.3329, 0.0520, 0.3949, 1.7792, 0.5283, 0.3928, 0.0066, 1.1835,
          0.0204, 0.2762, 1.0
        ];
}

enum Rating { again, hard, good, easy }

class FSRSCard {
  double stability;
  double difficulty;
  int reps;
  DateTime? due;
  double elapsedDays;

  FSRSCard({
    this.stability = 0.0,
    this.difficulty = 0.3,
    this.reps = 0,
    this.due,
    this.elapsedDays = 0.0,
  });
}

/// NURA Beyin — FSRS-5 tam parametreli SRS motoru
class NuraBrain {
  final FsrsParameters params;
  final double desiredRetention;

  NuraBrain({FsrsParameters? params, this.desiredRetention = 0.9})
      : params = params ?? FsrsParameters();

  double retrievability(FSRSCard card) {
    if (card.stability <= 0) return 0;
    return pow(1 + (card.elapsedDays * 19) / (81 * card.stability), -1.0)
        .toDouble();
  }

  double _initDifficulty(Rating r) =>
      params.w[0] - params.w[1] * (r.index - 3) + 0.1;

  double _initStability(Rating r) {
    if (r == Rating.again) return params.w[2];
    if (r == Rating.hard) return params.w[2] * params.w[4];
    if (r == Rating.good) return params.w[2];
    return params.w[3];
  }

  double _nextDifficulty(double d, Rating r) {
    double delta = params.w[15] * (r.index - 3);
    double nextD = d - delta + params.w[16];
    return params.w[17] * _initDifficulty(Rating.good) +
        (1 - params.w[17]) * nextD;
  }

  double _nextStabilitySuccess(
      double d, double s, double r, Rating rating) {
    double hardPenalty = rating == Rating.hard ? params.w[18] : 1.0;
    double easyBonus = rating == Rating.easy ? params.w[7] : 1.0;
    return s *
        (1 +
            exp(params.w[8]) *
                (11 - d) *
                pow(s, -params.w[9]) *
                (exp(params.w[10] * (1 - r)) - 1) *
                hardPenalty *
                easyBonus);
  }

  double _nextStabilityFail(double d, double s) =>
      params.w[11] *
      pow(d, -params.w[12]) *
      (pow(s, params.w[13]) * exp(params.w[14]) + 1);

  FSRSCard review(FSRSCard card, Rating rating, DateTime nowUtc) {
    double nextS, nextD;
    if (card.reps == 0) {
      nextD = _initDifficulty(rating);
      nextS = _initStability(rating);
    } else {
      nextD = _nextDifficulty(card.difficulty, rating);
      nextS = rating == Rating.again
          ? _nextStabilityFail(card.difficulty, card.stability)
          : _nextStabilitySuccess(
              card.difficulty, card.stability, retrievability(card), rating);
    }
    nextD = nextD.clamp(1.0, 10.0);
    nextS = nextS.clamp(0.1, 36500.0);
    int interval = _nextInterval(nextS);
    return FSRSCard(
      stability: nextS,
      difficulty: nextD,
      reps: card.reps + 1,
      elapsedDays: 0,
      due: nowUtc.add(Duration(days: interval)),
    );
  }

  int _nextInterval(double s) =>
      (s * (pow(desiredRetention, -1.0) - 1) / (19.0 / 81.0))
          .round()
          .clamp(1, 36500);
}
