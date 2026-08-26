import 'package:flutter/foundation.dart';
import 'package:home_widget/home_widget.dart';

import '../content/catalog.dart';
import '../models/models.dart';

class VoxeloHomeWidgetService {
  static const appGroupId = 'group.com.voxelo.voxelo';

  static Future<void> sync(UserProfile profile) async {
    if (kIsWeb) return;
    await HomeWidget.setAppGroupId(appGroupId);
    final scenarios = Catalog.forLang(profile.learnLang);
    final scenario = scenarios.isEmpty
        ? null
        : scenarios[DateTime.now().day % scenarios.length];
    await Future.wait([
      HomeWidget.saveWidgetData(
        'language',
        profile.learnLang.label(profile.uiLang),
      ),
      HomeWidget.saveWidgetData('daily_xp', profile.dailyXp),
      HomeWidget.saveWidgetData('total_xp', profile.totalXp),
      HomeWidget.saveWidgetData('streak', profile.streak),
      HomeWidget.saveWidgetData(
        'lesson',
        scenario?.title(profile.uiLang) ?? 'Bugünün pratiği',
      ),
      HomeWidget.saveWidgetData('goal', UserProfile.dailyXpGoal),
    ]);
    await HomeWidget.updateWidget(
      name: 'VoxeloHomeWidgetProvider',
      iOSName: 'VoxeloHomeWidget',
    );
  }
}
