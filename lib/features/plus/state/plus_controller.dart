import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nura/features/plus/data/billing_service.dart';
import 'package:nura/features/plus/data/fake_billing_service.dart';
import 'package:nura/features/plus/domain/entitlement.dart';

/// Üretimde RevenueCatBillingService (RevenueCat API anahtarı girilince)
/// devreye alınır. Şimdilik sahte servis ile akış test edilir.
final billingServiceProvider = Provider<BillingService>((ref) {
  return FakeBillingService();
});

final plusControllerProvider =
    StateNotifierProvider<PlusController, NuraEntitlement>((ref) {
  return PlusController(ref.watch(billingServiceProvider));
});

/// Entitlement durumunu yönetir. `isPlus` bayrağı YALNIZCA bu kontrolörün
/// state'inden türetilir — ekranlar doğrudan bayrak tutmaz (Contract 6).
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
