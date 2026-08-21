import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key});

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  int plan = 1;

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    return Scaffold(
      appBar: NuraAppBar(leading: IconButton(icon: const Icon(Icons.close), onPressed: () => context.pop())),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 24),
          children: [
            Text('NURA', textAlign: TextAlign.center, style: const TextStyle(color: Nura.forest, fontWeight: FontWeight.w700, letterSpacing: 2)),
            const SizedBox(height: 8),
            Text(i18n.paywallTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 8),
            const Text('Sınırsız AI konuşma, telaffuz, çevrimdışı klip.', textAlign: TextAlign.center, style: TextStyle(color: Nura.muted)),
            const SizedBox(height: 22),
            _plan(0, 'Aylık', '249 TL / ay', '≈ \$6.20 USD'),
            _plan(1, 'Yıllık · en iyi değer', '1.490 TL / yıl', '≈ \$3.10 USD / ay · 4 ay bedava'),
            _plan(2, 'Aile', '2.290 TL / yıl', '4 profil · ≈ \$4.75 USD / ay'),
            const SizedBox(height: 12),
            for (final f in [
              'Sınırsız konuşma',
              'CEFR yolu A1–B2',
              '5 dil: EN · ES · DE · FR · NL',
              'Çevir + SRS kaydet',
              'Reklamsız',
            ])
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Nura.forest, size: 20),
                    const SizedBox(width: 8),
                    Text(f),
                  ],
                ),
              ),
            const SizedBox(height: 12),
            ForestButton(
              label: i18n.plusCta,
              onPressed: () async {
                await ref.read(sessionProvider.notifier).setPlus(true);
                if (context.mounted) context.pop();
              },
            ),
            const SizedBox(height: 10),
            const Text('İstediğin an iptal. Fiyatlar mağazada yerelleşir; ekonomi USD kilitlidir.',
                textAlign: TextAlign.center, style: TextStyle(color: Nura.soft, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _plan(int i, String t, String price, String sub) {
    final sel = plan == i;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: NuraCard(
        onTap: () => setState(() => plan = i),
        color: sel ? Nura.cream2 : Nura.card,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t, style: TextStyle(fontWeight: FontWeight.w600, color: sel ? Nura.forest : Nura.ink)),
                  Text(sub, style: const TextStyle(color: Nura.muted, fontSize: 12)),
                ],
              ),
            ),
            Text(price, style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
