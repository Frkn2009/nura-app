/// NURA — Supabase bağlantı bilgileri.
///
/// Bu iki değeri Supabase Dashboard → Project Settings (⚙) → API bölümünden
/// kopyala ve buraya yapıştır:
///   - "Project URL"          → url
///   - "publishable" key      → publishableKey
///
/// Doldurulana kadar uygulama eskisi gibi tamamen yerel çalışır,
/// hiçbir şey bozulmaz. Doldurunca bulut senkronu otomatik açılır.
class SupaConfig {
  static const String url = 'https://qkhmtmwfwyscvtveiwui.supabase.co';
  static const String publishableKey =
      'sb_publishable_maEu9eoz4fuC_I17Vamrlg_NTtsjqzo';

  /// Anahtarlar girildi mi? (yeni sb_ veya eski eyJ formatı)
  static bool get isSet =>
      url.startsWith('https://') &&
      (publishableKey.startsWith('sb_') || publishableKey.startsWith('eyJ'));
}
