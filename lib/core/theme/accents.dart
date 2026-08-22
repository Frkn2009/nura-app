import 'package:flutter/material.dart';

/// NURA marka aksan paletleri.
///
/// Açık ve koyu temalar bu paletlerden beslenir; kullanıcı profil ekranından
/// mint (yeşil) veya indigo (#4F46E5) arasında geçiş yapabilir. Seçim
/// [UserProfile.themeAccent] içinde saklanır (geriye dönük uyumlu: varsayılan
/// mint, mevcut kullanıcı verisi bozulmaz).
class NuraAccent {
  const NuraAccent({
    required this.name,
    required this.primary,
    required this.primaryDark,
    required this.primaryLight,
    required this.darkPrimary,
    required this.darkOnPrimary,
    required this.darkPrimaryContainer,
    required this.darkOnPrimaryContainer,
  });

  final String name;

  /// Açık temada birincil renk.
  final Color primary;

  /// Açık temada buton / vurgu koyu tonu (kontrastlı metin için).
  final Color primaryDark;

  /// Açık temada container / seçili arka planı.
  final Color primaryLight;

  /// Koyu temada birincil renk (yüzeyler üzerinde okunur ton).
  final Color darkPrimary;
  final Color darkOnPrimary;
  final Color darkPrimaryContainer;
  final Color darkOnPrimaryContainer;

  static const mint = NuraAccent(
    name: 'mint',
    primary: Color(0xFF147D76),
    primaryDark: Color(0xFF0D5955),
    primaryLight: Color(0xFFE1F1EF),
    darkPrimary: Color(0xFF67C9C0),
    darkOnPrimary: Color(0xFF062F2D),
    darkPrimaryContainer: Color(0xFF164542),
    darkOnPrimaryContainer: Color(0xFFD5F5F1),
  );

  static const indigo = NuraAccent(
    name: 'indigo',
    primary: Color(0xFF4F46E5),
    primaryDark: Color(0xFF3730A3),
    primaryLight: Color(0xFFE0E7FF),
    darkPrimary: Color(0xFF818CF8),
    darkOnPrimary: Color(0xFF1E1B4B),
    darkPrimaryContainer: Color(0xFF312E81),
    darkOnPrimaryContainer: Color(0xFFE0E7FF),
  );

  static const all = [mint, indigo];
}
