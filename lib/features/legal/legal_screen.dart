import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n.dart';
import '../../core/theme/tokens.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

enum LegalType { privacy, terms }

/// Gizlilik politikası ve kullanım şartları — tek ekran, iki mod.
/// Metinler [I18n] üzerinden 7 arayüz dilinde gelir (t() sözlük sistemi).
class LegalScreen extends ConsumerWidget {
  const LegalScreen({super.key, required this.type});

  final LegalType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final isPrivacy = type == LegalType.privacy;

    return Scaffold(
      appBar: NuraAppBar(
        pageTitle: Text(isPrivacy ? i18n.privacyPolicy : i18n.termsOfService),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 32),
          child: Text(
            isPrivacy ? i18n.privacyBody : i18n.termsBody,
            style: const TextStyle(height: 1.6, color: Nura.ink, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
