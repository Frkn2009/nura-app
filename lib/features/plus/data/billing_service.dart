import 'package:voxelith/features/plus/domain/entitlement.dart';

abstract class BillingService {
  Future<List<BillingProduct>> fetchProducts();
  Future<VoxelithEntitlement> currentEntitlement();
  Future<void> purchase(BillingProduct product);
  Future<void> restorePurchases();
  void dispose();
}
