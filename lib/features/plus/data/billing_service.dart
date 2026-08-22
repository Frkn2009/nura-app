import 'package:nura/features/plus/domain/entitlement.dart';

/// Billing soyutlaması — Contract madde 6:
/// Client-side `isPlus` YASAK. Entitlement'ın tek kaynağı bu servisin
/// `currentEntitlement()` çağrısıdır (üretimde RevenueCat, geliştirmede Fake).
abstract class BillingService {
  Future<List<BillingProduct>> fetchProducts();

  Future<NuraEntitlement> currentEntitlement();

  Future<void> purchase(BillingProduct product);

  Future<void> restorePurchases();

  void dispose();
}
