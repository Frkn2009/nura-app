import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';
import '../plus/domain/entitlement.dart';
import '../plus/state/plus_controller.dart';

const _plusPlans = [nuraPlusMonthly, nuraPlusYearly, nuraPlusFamily];
const _businessPlans = [nuraBusinessMonthly, nuraBusinessYearly];

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key, this.business = false});

  final bool business;

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  late bool business = widget.business;
  int plan = 1;
  int businessPlan = 0;

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    return Scaffold(
      appBar: NuraAppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 24),
          children: [
            Text(
              'NURA',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Nura.forest,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              i18n.paywallTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            const Text(
              'Sınırsız AI konuşma, telaffuz, çevrimdışı klip.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Nura.muted),
            ),
            const SizedBox(height: 18),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('Plus')),
                ButtonSegment(value: true, label: Text('Business')),
              ],
              selected: {business},
              onSelectionChanged: (v) => setState(() => business = v.first),
            ),
            const SizedBox(height: 16),
            if (!business) ...[
              _plan(0, 'Aylık', '249 TL / ay', '≈ \$6.20 USD'),
              _plan(
                1,
                'Yıllık · en iyi değer',
                '1.490 TL / yıl',
                '≈ \$3.10 USD / ay · 4 ay bedava',
              ),
              _plan(
                2,
                'Aile',
                '2.290 TL / yıl',
                '4 profil · ≈ \$4.75 USD / ay',
              ),
              const SizedBox(height: 12),
              for (final f in [
                'Sınırsız konuşma',
                'CEFR yolu A1–B2',
                '30 dilin tamamı',
                'Nura ile canlı sohbet',
                'Çevir + SRS kaydet',
                'Toplantı Çevirmeni · günde 2 saat',
                'Reklamsız',
              ])
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Nura.forest,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(f),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              ForestButton(
                label: i18n.plusCta,
                onPressed: () async {
                  await ref
                      .read(plusControllerProvider.notifier)
                      .purchase(_plusPlans[plan]);
                  if (context.mounted) context.pop();
                },
              ),
            ] else ...[
              _businessPlanCard(0, 'Aylık', '699 TL / ay', '≈ \$17.30 USD'),
              _businessPlanCard(
                1,
                'Yıllık · en iyi değer',
                '4.190 TL / yıl',
                '≈ \$8.70 USD / ay · 4 ay bedava',
              ),
              const SizedBox(height: 12),
              for (final f in [
                'Tüm Plus özellikleri',
                'Toplantı Çevirmeni · günde 8 saat',
                'Yurt dışı iş görüşmesi / toplantı için tasarlandı',
                'Öncelikli destek',
              ])
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Nura.forest,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(f),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              ForestButton(
                label: i18n.plusCta,
                onPressed: () async {
                  await ref
                      .read(plusControllerProvider.notifier)
                      .purchase(_businessPlans[businessPlan]);
                  if (context.mounted) context.pop();
                },
              ),
            ],
            const SizedBox(height: 10),
            const Text(
              'İstediğin an iptal. Fiyatlar mağazada yerelleşir; ekonomi USD kilitlidir.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Nura.soft, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _businessPlanCard(int i, String t, String price, String sub) {
    final sel = businessPlan == i;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: NuraCard(
        onTap: () => setState(() => businessPlan = i),
        color: sel ? Nura.cream2 : Nura.card,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: sel ? Nura.forest : Nura.ink,
                    ),
                  ),
                  Text(
                    sub,
                    style: const TextStyle(color: Nura.muted, fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(price, style: const TextStyle(fontWeight: FontWeight.w700)),
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
                  Text(
                    t,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: sel ? Nura.forest : Nura.ink,
                    ),
                  ),
                  Text(
                    sub,
                    style: const TextStyle(color: Nura.muted, fontSize: 12),
                  ),
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
