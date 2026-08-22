import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/tokens.dart';

class NuraApp extends StatelessWidget {
  const NuraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NURA',
      debugShowCheckedModeBanner: false,
      theme: buildNuraTheme(),
      routerConfig: appRouter,
    );
  }
}
