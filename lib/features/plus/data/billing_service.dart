import '../domain/entitlement.dart';

/// Ödeme servisi soyutlaması.
///
/// Gerçek implementasyonlar (RevenueCat, Play Billing, App Store) bu arayüzün
/// arkasına takılır; UI yalnızca [NuraEntitlement] görür.
abstract class BillingService {
  Future<List<BillingProduct>> fetchProducts();

  Future<NuraEntitlement> currentEntitlement();

  Future<void> purchase(BillingProduct product);

  Future<void> restorePurchases();

  void dispose();
}
