import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class NotificationService {
  static bool _initialized = false;
  static const _firstReminderId = 7100;
  static const _reminderCount = 7;
  static const _channelKey = 'daily_practice';

  static Future<void> initialize() async {
    if (_initialized || kIsWeb) return;
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: _channelKey,
          channelName: 'Günlük pratik',
          channelDescription: 'NURA günlük ders ve seri hatırlatmaları',
          defaultColor: const Color(0xFF0D5955),
          ledColor: const Color(0xFFFFFFFF),
          importance: NotificationImportance.Default,
          playSound: true,
          enableVibration: true,
        ),
      ],
    );
    _initialized = true;
  }

  /// Cihazın yerel saatini kullanarak önümüzdeki yedi gün için günde yalnızca
  /// bir bildirim planlar. Uygulama her açıldığında kayan pencere yenilenir.
  static Future<void> sync(UserProfile profile) async {
    if (kIsWeb) return;
    await initialize();
    for (var offset = 0; offset < _reminderCount; offset++) {
      await AwesomeNotifications().cancelSchedule(_firstReminderId + offset);
    }
    if (!profile.notificationsEnabled) return;
    final allowed = await AwesomeNotifications().isNotificationAllowed() ||
        await AwesomeNotifications().requestPermissionToSendNotifications();
    if (!allowed) return;

    final now = DateTime.now();
    var first = DateTime(now.year, now.month, now.day, profile.reminderHour);
    if (!first.isAfter(now)) first = first.add(const Duration(days: 1));

    for (var offset = 0; offset < _reminderCount; offset++) {
      final content = contentFor(profile, offset);
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: _firstReminderId + offset,
          channelKey: _channelKey,
          title: content.$1,
          body: content.$2,
          category: NotificationCategory.Reminder,
          payload: const {'route': '/app'},
        ),
        schedule: NotificationCalendar.fromDate(
          date: first.add(Duration(days: offset)),
          allowWhileIdle: true,
          preciseAlarm: false,
        ),
      );
    }
  }

  /// Saf içerik seçimi test edilebilir ve bildirimler öğretmen tonunda kalır.
  static (String, String) contentFor(UserProfile profile, int dayOffset) {
    final turkish = profile.uiLang == UiLang.tr;
    if (profile.isPlus && dayOffset % 4 == 0) {
      return turkish
          ? ('NURA Plus', 'Sınırsız konuşma hakkın hazır. Bugünün sahnesine geç!')
          : ('NURA Plus', 'Unlimited speaking is ready. Start today’s scene.');
    }
    if (profile.streak >= 2 && dayOffset % 3 == 1) {
      return turkish
          ? ('Serini koru', '🔥 Serin ${profile.streak} gün! Bugün kırma!')
          : ('Keep your streak', '${profile.streak} days strong. Keep the chain alive today.');
    }
    if (dayOffset % 3 == 2) {
      return turkish
          ? ('Yeni oyun', '🎮 Yeni oyun: Harf Sıralama dene!')
          : ('Ready for a quick game?', 'Try Letter Order to sharpen your vocabulary.');
    }
    return turkish
        ? ('Hadi derse! 📚', 'Bugün henüz pratik yapmadın. Kısa bir konuşma yeter.')
        : ('Time to practise!', 'You have not practised today. One short conversation is enough.');
  }
}
