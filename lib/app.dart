import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/nura_theme.dart';
import 'data/models/models.dart';
import 'data/notifications/notification_service.dart';
import 'data/widgets/home_widget_service.dart';
import 'state/session.dart';

class NuraApp extends ConsumerWidget {
  const NuraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themePreference = ref.watch(
      sessionProvider.select((profile) => profile.themePreference),
    );
    ref.listen(
      sessionProvider,
      (_, profile) {
        unawaited(NotificationService.sync(profile).catchError((_) {}));
        unawaited(NuraHomeWidgetService.sync(profile).catchError((_) {}));
      },
    );
    return MaterialApp.router(
      title: 'NURA',
      debugShowCheckedModeBanner: false,
      theme: buildNuraTheme(),
      darkTheme: buildNuraDarkTheme(),
      themeMode: switch (themePreference) {
        AppThemePreference.system => ThemeMode.system,
        AppThemePreference.light => ThemeMode.light,
        AppThemePreference.dark => ThemeMode.dark,
      },
      routerConfig: router,
    );
  }
}
