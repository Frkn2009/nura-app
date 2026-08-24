import 'package:purchases_flutter/purchases_flutter.dart';

import 'billing_service.dart';
import '../domain/entitlement.dart';

/// Gerçek RevenueCat entegrasyonu. `NURA_REVENUECAT_API_KEY` dart-define'ı
/// girilmediyse [isConfigured] false döner ve `PlusController`
/// [FakeBillingService]'i kullanmaya devam eder — anahtar yokken uygulama
/// hiç bozulmaz, sadece gerçek satın alma kapalı kalır.
class RevenueCatBillingService implements BillingService {
  static const _apiKey = String.fromEnvironment('NURA_REVENUECAT_API_KEY');

  /// RevenueCat panelinde tanımlı entitlement kimliği. Panelde farklı bir
  /// isim kullandıysan `--dart-define=NURA_REVENUECAT_ENTITLEMENT_ID=...`
  /// ile geçersiz kıl.
  static const _entitlementId = String.fromEnvironment(
    'NURA_REVENUECAT_ENTITLEMENT_ID',
    defaultValue: 'plus',
  );

  static bool get isConfigured => _apiKey.isNotEmpty;

  static Future<void> configureIfNeeded() async {
    if (!isConfigured) return;
    await Purchases.configure(PurchasesConfiguration(_apiKey));
  }

  final Map<String, Package> _packagesById = {};

  @override
  Future<List<BillingProduct>> fetchProducts() async {
    final offerings = await Purchases.getOfferings();
    final current = offerings.current;
    if (current == null) return const [];
    _packagesById
      ..clear()
      ..addEntries(
        current.availablePackages.map(
          (pkg) => MapEntry(pkg.storeProduct.identifier, pkg),
        ),
      );
    return current.availablePackages
        .map(
          (pkg) => BillingProduct(
            id: pkg.storeProduct.identifier,
            title: pkg.storeProduct.title,
            description: pkg.storeProduct.description,
          ),
        )
        .toList(growable: false);
  }

  @override
  Future<NuraEntitlement> currentEntitlement() async {
    final info = await Purchases.getCustomerInfo();
    return info.entitlements.active.containsKey(_entitlementId)
        ? NuraEntitlement.plus
        : NuraEntitlement.free;
  }

  @override
  Future<void> purchase(BillingProduct product) async {
    // PaywallScreen sabit BillingProduct sabitlerini kullanıyor, önce
    // fetchProducts() çağırmıyor — paket haritası boşsa burada dolduruyoruz.
    var pkg = _packagesById[product.id];
    if (pkg == null) {
      await fetchProducts();
      pkg = _packagesById[product.id];
    }
    if (pkg == null) {
      throw StateError(
        'RevenueCat panelinde "${product.id}" ürün kimliğiyle eşleşen bir paket bulunamadı. '
        'Store (App Store Connect / Play Console) ürün kimliğinin bu değerle aynı olduğundan emin ol.',
      );
    }
    await Purchases.purchase(PurchaseParams.package(pkg));
  }

  @override
  Future<void> restorePurchases() async {
    await Purchases.restorePurchases();
  }

  @override
  void dispose() {}
}
