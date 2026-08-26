import 'package:voxelo/features/plus/domain/entitlement.dart';

abstract class BillingService {
  Future<List<BillingProduct>> fetchProducts();
  Future<VoxeloEntitlement> currentEntitlement();
  Future<void> purchase(BillingProduct product);
  Future<void> restorePurchases();
  void dispose();
}
