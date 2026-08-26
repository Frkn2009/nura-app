import 'package:voxelo/features/plus/data/billing_service.dart';
import 'package:voxelo/features/plus/domain/entitlement.dart';

class FakeBillingService implements BillingService {
  FakeBillingService({this.entitlement = VoxeloEntitlement.free});

  VoxeloEntitlement entitlement;
  bool restoreCalled = false;
  bool purchaseCalled = false;

  @override
  Future<List<BillingProduct>> fetchProducts() async {
    return const [
      voxeloPlusMonthly,
      voxeloPlusYearly,
      voxeloPlusFamily,
      voxeloBusinessMonthly,
      voxeloBusinessYearly,
    ];
  }

  @override
  Future<VoxeloEntitlement> currentEntitlement() async => entitlement;

  @override
  Future<void> purchase(BillingProduct product) async {
    purchaseCalled = true;
    entitlement =
        product.id == voxeloBusinessMonthly.id ||
            product.id == voxeloBusinessYearly.id
        ? VoxeloEntitlement.business
        : VoxeloEntitlement.plus;
  }

  @override
  Future<void> restorePurchases() async {
    restoreCalled = true;
    entitlement = VoxeloEntitlement.plus;
  }

  @override
  void dispose() {}
}
