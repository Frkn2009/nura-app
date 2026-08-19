/// NURA — Supabase bağlantı bilgileri.
///
/// Bu iki değeri Supabase Dashboard → Project Settings (⚙) → API bölümünden
/// kopyala ve buraya yapıştır:
///   - "Project URL"          → url
///   - "anon public" key      → anonKey
///
/// Doldurulana kadar uygulama eskisi gibi tamamen yerel çalışır,
/// hiçbir şey bozulmaz. Doldurunca bulut senkronu otomatik açılır.
class SupaConfig {
  static const String url = 'SENIN_SUPABASE_URL';
  static const String anonKey = 'SENIN_SUPABASE_ANON_KEY';

  static bool get isSet =>
      url.startsWith('https://') && anonKey.startsWith('eyJ');
}
