import 'package:voxelith/features/plus/data/billing_service.dart';
import 'package:voxelith/features/plus/domain/entitlement.dart';

class FakeBillingService implements BillingService {
  FakeBillingService({this.entitlement = VoxelithEntitlement.free});

  VoxelithEntitlement entitlement;
  bool restoreCalled = false;
  bool purchaseCalled = false;

  @override
  Future<List<BillingProduct>> fetchProducts() async {
    return const [
      voxelithPlusMonthly,
      voxelithPlusYearly,
      voxelithPlusFamily,
      voxelithBusinessMonthly,
      voxelithBusinessYearly,
    ];
  }

  @override
  Future<VoxelithEntitlement> currentEntitlement() async => entitlement;

  @override
  Future<void> purchase(BillingProduct product) async {
    purchaseCalled = true;
    entitlement =
        product.id == voxelithBusinessMonthly.id ||
            product.id == voxelithBusinessYearly.id
        ? VoxelithEntitlement.business
        : VoxelithEntitlement.plus;
  }

  @override
  Future<void> restorePurchases() async {
    restoreCalled = true;
    entitlement = VoxelithEntitlement.plus;
  }

  @override
  void dispose() {}
}
