import 'package:nura/features/plus/data/billing_service.dart';
import 'package:nura/features/plus/domain/entitlement.dart';

class FakeBillingService implements BillingService {
  FakeBillingService({this.entitlement = NuraEntitlement.free});

  NuraEntitlement entitlement;
  bool restoreCalled = false;
  bool purchaseCalled = false;

  @override
  Future<List<BillingProduct>> fetchProducts() async {
    return const [nuraPlusMonthly, nuraPlusYearly, nuraPlusFamily];
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
