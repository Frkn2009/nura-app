import 'billing_service.dart';
import '../domain/entitlement.dart';

/// Test/geliştirme için sahte servis. Gerçek mağaza entegrasyonu bu
/// implementasyonun yerine geçtiğinde UI kodu değişmez.
class FakeBillingService implements BillingService {
  FakeBillingService({this.entitlement = NuraEntitlement.free});

  NuraEntitlement entitlement;
  bool restoreCalled = false;
  bool purchaseCalled = false;

  @override
  Future<List<BillingProduct>> fetchProducts() async {
    return const [nuraPlusLifetimeProduct];
  }

  @override
  Future<NuraEntitlement> currentEntitlement() async => entitlement;

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
