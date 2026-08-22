import 'package:flutter/foundation.dart';

enum SrsCardState {
  newCard,
  learning,
  review,
  relearning,
  suspended,
  buried,
}

/// Kullanıcı puanı. Sırası `ReviewRating` (algorithm katmanı) ile 1:1 aynıdır:
/// again, hard, good, easy.
enum AnswerQuality {
  again,
  hard,
  good,
  easy,
}

/// Kalıcı tekrar kartı. `phrase` alanı YOKTUR (Contract madde 2):
/// kart, kalıbı `id` ile Catalog'a bağlar.
@immutable
class SrsCard {
  static const String algorithmV14 = 'nura-fsrs5-v1.4';

  const SrsCard({
    required this.id,
    required this.state,
    required this.stability,
    required this.difficulty,
    required this.reps,
    required this.lapses,
    required this.step,
    required this.scheduledDays,
    required this.lastReviewAtUtc,
    required this.dueAtUtc,
    required this.algorithmVersion,
  });

  final String id;
  final SrsCardState state;
  final double stability;
  final double difficulty;
  final int reps;
  final int lapses;
  final int step;
  final int scheduledDays;

  /// Son tekrarın anı. `null` = henüz hiç tekrarlanmamış (yeni kart).
  final DateTime? lastReviewAtUtc;
  final DateTime dueAtUtc;
  final String algorithmVersion;

  /// Yeni öğrenilen kalıp: ilk tekrar bugünkü oturumda geçer.
  factory SrsCard.newCard(String id, DateTime nowUtc) {
    return SrsCard(
      id: id,
      state: SrsCardState.newCard,
      stability: 0,
      difficulty: 5,
      reps: 0,
      lapses: 0,
      step: 0,
      scheduledDays: 0,
      lastReviewAtUtc: null,
      dueAtUtc: nowUtc,
      algorithmVersion: algorithmV14,
    );
  }

  /// v1.3 ve öncesi `Map<String,int>` epoch-gün verisini FSRS kartına yükseltir.
  /// Geçmişteki vadede zaten düşmüş olan kartlar hemen tekrar kuyruğuna girer;
  /// bu, eski "bugün tekrar var" davranışını korur.
  factory SrsCard.migratedFromEpochDay(String id, int epochDay) {
    return SrsCard(
      id: id,
      state: SrsCardState.review,
      stability: 2.0,
      difficulty: 5.0,
      reps: 0,
      lapses: 0,
      step: 0,
      scheduledDays: 1,
      lastReviewAtUtc: null,
      dueAtUtc:
          DateTime.fromMillisecondsSinceEpoch(epochDay * 86400000, isUtc: true),
      algorithmVersion: algorithmV14,
    );
  }

  SrsCard copyWith({
    String? id,
    SrsCardState? state,
    double? stability,
    double? difficulty,
    int? reps,
    int? lapses,
    int? step,
    int? scheduledDays,
    DateTime? lastReviewAtUtc,
    DateTime? dueAtUtc,
    String? algorithmVersion,
  }) {
    return SrsCard(
      id: id ?? this.id,
      state: state ?? this.state,
      stability: stability ?? this.stability,
      difficulty: difficulty ?? this.difficulty,
      reps: reps ?? this.reps,
      lapses: lapses ?? this.lapses,
      step: step ?? this.step,
      scheduledDays: scheduledDays ?? this.scheduledDays,
      // `lastReviewAtUtc` bu modelde asla sıfırlanmaz; null = "değiştirme".
      lastReviewAtUtc: lastReviewAtUtc ?? this.lastReviewAtUtc,
      dueAtUtc: dueAtUtc ?? this.dueAtUtc,
      algorithmVersion: algorithmVersion ?? this.algorithmVersion,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'state': state.name,
      'stability': stability,
      'difficulty': difficulty,
      'reps': reps,
      'lapses': lapses,
      'step': step,
      'scheduledDays': scheduledDays,
      'lastReviewAtUtc': lastReviewAtUtc?.toIso8601String(),
      'dueAtUtc': dueAtUtc.toIso8601String(),
      'algorithmVersion': algorithmVersion,
    };
  }

  factory SrsCard.fromJson(Map<String, dynamic> json, {String? fallbackId}) {
    return SrsCard(
      id: json['id'] as String? ?? fallbackId ?? 'unknown',
      state: SrsCardState.values.firstWhere(
        (e) => e.name == json['state'],
        orElse: () => SrsCardState.newCard,
      ),
      stability: (json['stability'] as num?)?.toDouble() ?? 1.0,
      difficulty: (json['difficulty'] as num?)?.toDouble() ?? 5.0,
      reps: (json['reps'] as num?)?.toInt() ?? 0,
      lapses: (json['lapses'] as num?)?.toInt() ?? 0,
      step: (json['step'] as num?)?.toInt() ?? 0,
      scheduledDays: (json['scheduledDays'] as num?)?.toInt() ?? 1,
      lastReviewAtUtc:
          DateTime.tryParse(json['lastReviewAtUtc'] as String? ?? '')?.toUtc(),
      dueAtUtc: DateTime.tryParse(json['dueAtUtc'] as String? ?? '')?.toUtc() ??
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      algorithmVersion: json['algorithmVersion'] as String? ?? algorithmV14,
    );
  }
}
