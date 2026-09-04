import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../state/session.dart';
import '../../ui/widgets.dart';
import '../plus/domain/entitlement.dart';
import '../plus/state/plus_controller.dart';

const _plusPlans = [voxelithPlusMonthly, voxelithPlusYearly, voxelithPlusFamily];
const _businessPlans = [voxelithBusinessMonthly, voxelithBusinessYearly];

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
  bool _restoring = false;
  bool _purchasing = false;

  Future<void> _purchase(BillingProduct product) async {
    setState(() => _purchasing = true);
    try {
      await ref.read(plusControllerProvider.notifier).purchase(product);
      if (!mounted) return;
      context.pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _purchasing = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Satın alma tamamlanamadı: $e')));
    }
  }

  // App Store Kural 3.1.5 (ve Google Play'in benzer beklentisi): otomatik
  // yenilenen abonelik satan uygulamalar arayüzde erişilebilir bir "satın
  // alımları geri yükle" eylemi sunmak zorunda. `PlusController.restore()`
  // zaten vardı ama hiçbir ekranda çağrılmıyordu.
  Future<void> _restorePurchases() async {
    setState(() => _restoring = true);
    await ref.read(plusControllerProvider.notifier).restore();
    if (!mounted) return;
    setState(() => _restoring = false);
    final entitlement = ref.read(plusControllerProvider);
    final restored =
        entitlement == VoxelithEntitlement.plus ||
        entitlement == VoxelithEntitlement.business;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          restored
              ? 'Satın alımların geri yüklendi.'
              : 'Geri yüklenecek bir satın alma bulunamadı.',
        ),
      ),
    );
    if (restored && mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: VoxelithAppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          tooltip: 'Kapat',
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 24),
          children: [
            Text(
              'VOXELITH',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: scheme.primary,
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
            Text(
              'Sınırsız AI konuşma, telaffuz, çevrimdışı klip.',
              textAlign: TextAlign.center,
              style: TextStyle(color: scheme.onSurfaceVariant),
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
              _plan(0, 'Aylık', '240 TL / ay', '≈ \$6.00 USD'),
              _plan(
                1,
                'Yıllık · en iyi değer',
                '2.600 TL / yıl',
                '\$65 USD / yıl · ≈ \$5.42 USD / ay',
              ),
              _plan(
                2,
                'Aile',
                '8.000 TL / yıl',
                '4 profil · \$200 USD / yıl · ≈ \$16.67 USD / ay',
              ),
              const SizedBox(height: 12),
              for (final f in [
                'Sınırsız konuşma',
                'CEFR yolu A1–B2',
                '30 dilin tamamı',
                'Voxelith ile canlı sohbet',
                'Çevir + SRS kaydet',
                'Reklamsız',
              ])
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: scheme.primary, size: 20),
                      const SizedBox(width: 8),
                      Text(f),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _purchasing
                    ? null
                    : () => _purchase(_plusPlans[plan]),
                child: _purchasing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(i18n.plusCta),
              ),
            ] else ...[
              _businessPlanCard(0, 'Aylık', '699 TL / ay', '≈ \$17.30 USD'),
              _businessPlanCard(
                1,
                'Yıllık · en iyi değer',
                '8.000 TL / yıl',
                'Tek profil · \$200 USD / yıl · ≈ \$16.67 USD / ay',
              ),
              const SizedBox(height: 12),
              for (final f in [
                'Tüm Plus özellikleri',
                'Günlük AI analiz, sohbet, ses ve çeviri hakkı ~3 kat daha yüksek',
                'Öncelikli destek',
              ])
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: scheme.primary, size: 20),
                      const SizedBox(width: 8),
                      Text(f),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _purchasing
                    ? null
                    : () => _purchase(_businessPlans[businessPlan]),
                child: _purchasing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(i18n.plusCta),
              ),
            ],
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: _restoring ? null : _restorePurchases,
                child: _restoring
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Satın alımları geri yükle'),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'İstediğin an iptal. Fiyatlar mağazada yerelleşir; ekonomi USD kilitlidir.',
              textAlign: TextAlign.center,
              style: TextStyle(color: scheme.outline, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => context.push('/terms'),
                  child: const Text(
                    'Kullanım Koşulları',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Text('·', style: TextStyle(color: scheme.outline)),
                TextButton(
                  onPressed: () => context.push('/privacy'),
                  child: const Text('Gizlilik', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _businessPlanCard(int i, String t, String price, String sub) {
    final sel = businessPlan == i;
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: VoxelithCard(
        onTap: () => setState(() => businessPlan = i),
        color: sel ? scheme.primaryContainer : Theme.of(context).cardColor,
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
                      color: sel ? scheme.primary : scheme.onSurface,
                    ),
                  ),
                  Text(
                    sub,
                    style: TextStyle(
                      color: scheme.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: scheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _plan(int i, String t, String price, String sub) {
    final sel = plan == i;
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: VoxelithCard(
        onTap: () => setState(() => plan = i),
        color: sel ? scheme.primaryContainer : Theme.of(context).cardColor,
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
                      color: sel ? scheme.primary : scheme.onSurface,
                    ),
                  ),
                  Text(
                    sub,
                    style: TextStyle(
                      color: scheme.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: scheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
