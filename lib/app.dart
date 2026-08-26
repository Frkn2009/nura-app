import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/amber_theme.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/voxelo_theme.dart';
import 'data/models/models.dart';
import 'data/notifications/notification_service.dart';
import 'data/widgets/home_widget_service.dart';
import 'state/session.dart';

class VoxeloApp extends ConsumerWidget {
  const VoxeloApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themePreference = ref.watch(
      sessionProvider.select((profile) => profile.themePreference),
    );
    ref.listen(sessionProvider, (_, profile) {
      unawaited(NotificationService.sync(profile).catchError((_) {}));
      unawaited(VoxeloHomeWidgetService.sync(profile).catchError((_) {}));
    });
    return MaterialApp.router(
      title: 'VOXELO',
      debugShowCheckedModeBanner: false,
      theme: themePreference == AppThemePreference.amber
          ? buildVoxeloAmberTheme()
          : buildVoxeloTheme(),
      darkTheme: buildVoxeloDarkTheme(),
      themeMode: switch (themePreference) {
        AppThemePreference.system => ThemeMode.system,
        AppThemePreference.light => ThemeMode.light,
        AppThemePreference.dark => ThemeMode.dark,
        AppThemePreference.amber => ThemeMode.light,
      },
      routerConfig: router,
    );
  }
}
