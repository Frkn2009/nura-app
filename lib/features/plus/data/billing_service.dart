import 'package:nura/features/plus/domain/entitlement.dart';

abstract class BillingService {
  Future<List<BillingProduct>> fetchProducts();
  Future<NuraEntitlement> currentEntitlement();
  Future<void> purchase(BillingProduct product);
  Future<void> restorePurchases();
  void dispose();
}
