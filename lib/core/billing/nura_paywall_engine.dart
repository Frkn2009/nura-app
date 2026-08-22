import 'package:purchases_flutter/purchases_flutter.dart';

/// RevenueCat — server-side doğrulama katmanı (Contract madde 6).
///
/// Client-side `isPlus` bayrağı üretime YASAK; tek kaynak bu motorun
/// entitlement sorgularıdır. `publicApiKey` bir secret değil (RevenueCat
/// public key); yine de production'da ortam değişkeniyle enjekte etmek
/// en temiz yoldur — placeholder'ı mağaza yayınından önce değiştir.
class NuraPaywallEngine {
  static String publicApiKey = 'YOUR_REVENUECAT_PUBLIC_KEY';

  static Future<void> init(String userId) async {
    await Purchases.configure(
      PurchasesConfiguration(publicApiKey)..appUserID = userId,
    );
  }

  static Future<Offering?> getCurrentOffering() async =>
      (await Purchases.getOfferings())?.current;

  static Future<bool> purchasePlus(Package package) async {
    try {
      return (await Purchases.purchasePackage(package))
              .entitlements.all['plus']
              ?.isActive ??
          false;
    } on PurchasesError catch (_) {
      return false;
    }
  }

  static Future<bool> isPlusActive() async =>
      (await Purchases.getCustomerInfo()).entitlements.all['plus']?.isActive ??
      false;

  static Future<bool> restorePurchases() async =>
      (await Purchases.restorePurchases()).entitlements.all['plus']?.isActive ??
      false;
}
