import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/nura_theme.dart';
import 'data/notifications/notification_service.dart';
import 'state/session.dart';

class NuraApp extends ConsumerWidget {
  const NuraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    ref.listen(
      sessionProvider,
      (_, profile) {
        unawaited(NotificationService.sync(profile).catchError((_) {}));
      },
      fireImmediately: true,
    );
    return MaterialApp.router(
      title: 'NURA',
      debugShowCheckedModeBanner: false,
      theme: buildNuraTheme(),
      routerConfig: router,
    );
  }
}
