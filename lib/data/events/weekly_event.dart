import '../models/models.dart';

class WeeklyEvent {
  const WeeklyEvent({
    required this.id,
    required this.language,
    required this.multiplier,
    required this.title,
    required this.description,
  });

  final String id;
  final LearnLang language;
  final int multiplier;
  final String title;
  final String description;

  static WeeklyEvent current() => WeeklyEvent(
    id: 'spanish_double_${weekKey()}',
    language: LearnLang.es,
    multiplier: 2,
    title: 'İspanyolca XP ×2',
    description: 'Bu hafta İspanyolca sahne ve oyunlarından iki kat XP kazan.',
  );

  static String weekKey([DateTime? moment]) {
    final now = (moment ?? DateTime.now()).toUtc();
    final monday = DateTime.utc(
      now.year,
      now.month,
      now.day,
    ).subtract(Duration(days: now.weekday - DateTime.monday));
    String two(int value) => value.toString().padLeft(2, '0');
    return '${monday.year}-${two(monday.month)}-${two(monday.day)}';
  }

  bool isJoined(UserProfile profile) => profile.joinedEventId == id;

  bool applies(UserProfile profile) =>
      isJoined(profile) && profile.learnLang == language;
}
