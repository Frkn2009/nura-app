import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/billing_service.dart';
import '../data/fake_billing_service.dart';
import '../domain/entitlement.dart';

final billingServiceProvider = Provider<BillingService>((ref) {
  // TODO: Mağaza entegrasyonunda FakeBillingService → gerçek servis.
  return FakeBillingService();
});

final plusControllerProvider =
    StateNotifierProvider<PlusController, NuraEntitlement>((ref) {
  return PlusController(ref.watch(billingServiceProvider));
});

class PlusController extends StateNotifier<NuraEntitlement> {
  PlusController(this._billingService) : super(NuraEntitlement.free);

  final BillingService _billingService;

  Future<void> loadEntitlement() async {
    state = await _billingService.currentEntitlement();
  }

  Future<void> purchase(BillingProduct product) async {
    await _billingService.purchase(product);
    state = await _billingService.currentEntitlement();
  }

  Future<void> restore() async {
    await _billingService.restorePurchases();
    state = await _billingService.currentEntitlement();
  }
}
