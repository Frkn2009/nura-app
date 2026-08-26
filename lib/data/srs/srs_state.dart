import 'package:flutter/foundation.dart';

enum SrsCardState { newCard, learning, review, relearning, suspended, buried }

enum AnswerQuality { again, hard, good, easy }

@immutable
class SrsCard {
  const SrsCard({
    required this.id,
    required this.state,
    required this.stability,
    required this.difficulty,
    required this.reps,
    required this.lapses,
    required this.step,
    required this.scheduledDays,
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
  final DateTime dueAtUtc;
  final String algorithmVersion;

  SrsCard copyWith({
    String? id,
    SrsCardState? state,
    double? stability,
    double? difficulty,
    int? reps,
    int? lapses,
    int? step,
    int? scheduledDays,
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
      dueAtUtc:
          DateTime.tryParse(json['dueAtUtc'] as String? ?? '')?.toUtc() ??
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      algorithmVersion: json['algorithmVersion'] as String? ?? 'voxelo-sm2-lite',
    );
  }
}
