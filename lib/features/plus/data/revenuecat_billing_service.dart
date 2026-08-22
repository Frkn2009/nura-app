import 'package:purchases_flutter/purchases_flutter.dart';

import 'package:nura/core/billing/nura_paywall_engine.dart';
import 'package:nura/features/plus/data/billing_service.dart';
import 'package:nura/features/plus/domain/entitlement.dart';

/// Üretim billing servisi: RevenueCat üzerinden Play/Apple doğrulaması.
///
/// Devreye alma (Play Console ürünleri + RevenueCat anahtarı hazır olunca):
///   1. `NuraPaywallEngine.publicApiKey = <revenuecat_public_key>;`
///   2. `billingServiceProvider`'ı bu servisle override et (main.dart):
///      billingServiceProvider.overrideWithValue(
///        RevenueCatBillingService(appUserId: <stable_user_id>),
///      )
class RevenueCatBillingService implements BillingService {
  RevenueCatBillingService({required this.appUserId});

  final String appUserId;
  bool _ready = false;

  Future<void> _ensureReady() async {
    if (!_ready) {
      await NuraPaywallEngine.init(appUserId);
      _ready = true;
    }
  }

  @override
  Future<List<BillingProduct>> fetchProducts() async {
    await _ensureReady();
    final offering = await NuraPaywallEngine.getCurrentOffering();
    if (offering == null) {
      return const [
        nuraPlusMonthlyProduct,
        nuraPlusYearlyProduct,
        nuraPlusFamilyProduct,
      ];
    }
    return offering.packages
        .map((package) => BillingProduct(
              id: package.identifier,
              title: package.product.title,
              description: package.product.description,
            ))
        .toList(growable: false);
  }

  @override
  Future<NuraEntitlement> currentEntitlement() async {
    await _ensureReady();
    return NuraPaywallEngine.isPlusActive()
        ? NuraEntitlement.plus
        : NuraEntitlement.free;
  }

  @override
  Future<void> purchase(BillingProduct product) async {
    await _ensureReady();
    final offering = await NuraPaywallEngine.getCurrentOffering();
    final packages = offering?.packages ?? const <Package>[];
    Package? target;
    for (final package in packages) {
      if (package.identifier == product.id) {
        target = package;
        break;
      }
    }
    if (target != null) {
      await NuraPaywallEngine.purchasePlus(target);
    }
  }

  @override
  Future<void> restorePurchases() async {
    await _ensureReady();
    await NuraPaywallEngine.restorePurchases();
  }

  @override
  void dispose() {}
}
