import 'package:nura/features/plus/data/billing_service.dart';
import 'package:nura/features/plus/domain/entitlement.dart';

/// Geliştirme/test için sahte billing servisi. Gerçek Play/Apple bağlanana
/// kadar uygulama bu servisle çalışır; entitlement akışı üretime birebir aynıdır.
class FakeBillingService implements BillingService {
  FakeBillingService({
    this.entitlement = NuraEntitlement.free,
  });

  NuraEntitlement entitlement;
  bool restoreCalled = false;
  bool purchaseCalled = false;

  @override
  Future<List<BillingProduct>> fetchProducts() async {
    return const [
      nuraPlusMonthlyProduct,
      nuraPlusYearlyProduct,
      nuraPlusFamilyProduct,
      nuraPlusLifetimeProduct,
    ];
  }

  @override
  Future<NuraEntitlement> currentEntitlement() async {
    return entitlement;
  }

  @override
  Future<void> purchase(BillingProduct product) async {
    purchaseCalled = true;
    entitlement = NuraEntitlement.plus;
  }

  @override
  Future<void> restorePurchases() async {
    restoreCalled = true;
    entitlement = NuraEntitlement.plus;
  }

  @override
  void dispose() {}
}
