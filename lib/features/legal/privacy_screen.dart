import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// Gizlilik ekranı — v1.3 devir notundaki "LegalScreen (7 dil)" maddesinin
/// bu repo hattındaki karşılığı: metin i18n.dart üzerinden 7 dilde gelir.
class PrivacyScreen extends ConsumerWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    return Scaffold(
      appBar: NuraAppBar(pageTitle: Text(i18n.privacyTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 32),
        children: [
          Text(i18n.privacyTitle,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Text(
            i18n.privacyBody,
            style: const TextStyle(height: 1.5, color: Nura.ink, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
