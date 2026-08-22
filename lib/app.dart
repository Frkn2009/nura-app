import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/tokens.dart';
import 'features/auth/presentation/auth_gate.dart';

class NuraApp extends StatelessWidget {
  const NuraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NURA',
      debugShowCheckedModeBanner: false,
      theme: buildNuraTheme(),
      // Misafir 2 dakika inceleyebilir; sonra oturum açma zorunlu.
      builder: (context, child) => AuthGate(child: child ?? const SizedBox.shrink()),
      routerConfig: appRouter,
    );
  }
}
