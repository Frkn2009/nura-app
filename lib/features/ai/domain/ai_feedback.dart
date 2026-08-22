import 'package:flutter/foundation.dart';

/// AI geri bildirim modelleri

@immutable
class AiFeedback {
  const AiFeedback({
    required this.userAnswer,
    required this.correctedAnswer,
    required this.score,
    required this.tips,
    required this.encouragement,
  });

  final String userAnswer;
  final String correctedAnswer;
  final int score; // 0-100
  final List<String> tips;
  final String encouragement;
}

@immutable
class AiScenario {
  const AiScenario({
    required this.topic,
    required this.level,
    required this.dialogue,
    required this.vocabulary,
  });

  final String topic;
  final String level;
  final List<AiDialogueLine> dialogue;
  final List<AiVocabItem> vocabulary;
}

@immutable
class AiDialogueLine {
  const AiDialogueLine({
    required this.speaker,
    required this.text,
    required this.translation,
  });

  final String speaker;
  final String text;
  final String translation;
}

@immutable
class AiVocabItem {
  const AiVocabItem({
    required this.word,
    required this.translation,
    required this.example,
  });

  final String word;
  final String translation;
  final String example;
}

@immutable
class LessonSummary {
  const LessonSummary({
    required this.reviewedCount,
    required this.masteredCount,
    required this.difficultWords,
    required this.message,
    required this.streakDays,
  });

  final int reviewedCount;
  final int masteredCount;
  final List<String> difficultWords;
  final String message;
  final int streakDays;
}
