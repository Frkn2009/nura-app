import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxelo/features/plus/data/billing_service.dart';
import 'package:voxelo/features/plus/data/fake_billing_service.dart';
import 'package:voxelo/features/plus/data/revenuecat_billing_service.dart';
import 'package:voxelo/features/plus/domain/entitlement.dart';
import 'package:voxelo/state/session.dart';

final billingServiceProvider = Provider<BillingService>((ref) {
  return RevenueCatBillingService.isConfigured
      ? RevenueCatBillingService()
      : FakeBillingService();
});

final plusControllerProvider =
    StateNotifierProvider<PlusController, VoxeloEntitlement>((ref) {
      return PlusController(ref.watch(billingServiceProvider), ref);
    });

/// Gerçek satın alma/kurtarma akışının tek girişi. `_billingService` gerçek
/// bir RevenueCat implementasyonuyla değiştirildiğinde bu sınıf değişmeden
/// kalır. Sonucu ayrıca `SessionController.isPlus`'a yazar çünkü uygulamanın
/// geri kalanı (speak limiti, reklamsız, AI sohbet gate'i vb.) hâlâ oradan
/// okuyor — iki ayrı "Plus" kaynağı olmasın diye köprü burada kuruluyor.
class PlusController extends StateNotifier<VoxeloEntitlement> {
  PlusController(this._billingService, this._ref) : super(VoxeloEntitlement.free);

  final BillingService _billingService;
  final Ref _ref;

  Future<void> loadEntitlement() async {
    state = await _billingService.currentEntitlement();
    await _syncSession();
  }

  Future<void> purchase(BillingProduct product) async {
    await _billingService.purchase(product);
    state = await _billingService.currentEntitlement();
    await _syncSession();
  }

  Future<void> restore() async {
    await _billingService.restorePurchases();
    state = await _billingService.currentEntitlement();
    await _syncSession();
  }

  Future<void> _syncSession() async {
    final notifier = _ref.read(sessionProvider.notifier);
    // Business, Plus'ın üzerinde bir katman — Business aboneleri de Plus'a
    // bağlı tüm özellikleri (sınırsız konuşma, reklamsız vb.) kullanabilsin
    // diye isPlus de true set edilir.
    await notifier.setPlus(
      state == VoxeloEntitlement.plus || state == VoxeloEntitlement.business,
    );
    await notifier.setBusiness(state == VoxeloEntitlement.business);
  }
}
