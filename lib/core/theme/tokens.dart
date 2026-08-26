import 'package:flutter/material.dart';

/// VOXELO Tema Tokenleri — Duolingo/Drops tarzı canlı, oyunsu, samimi
class VoxeloTokens {
  VoxeloTokens._();

  // Arka plan
  static const background = Color(0xFFF7F7F7);
  static const surface = Colors.white;

  // Ana renkler
  static const primary = Color(0xFF58CC02); // Yeşil — başarı, devam
  static const primaryDark = Color(0xFF46A302);
  static const accent = Color(0xFF1CB0F6); // Mavi — bilgi, AI
  static const accentDark = Color(0xFF158DD0);
  static const danger = Color(0xFFFF4B4B); // Kırmızı — hata, kalp
  static const gold = Color(0xFFFFC800); // Altın — ödül, streak, çark
  static const goldDark = Color(0xFFDBA800);
  static const purple = Color(0xFF9B72CF); // Mor — premium

  // Metin
  static const textPrimary = Color(0xFF3C3C3C);
  static const textSecondary = Color(0xFF777777);
  static const textOnPrimary = Colors.white;

  // Gradient
  static const heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1CB0F6), Color(0xFF58CC02)],
  );

  // Radius
  static const radiusSmall = 12.0;
  static const radiusMedium = 20.0;
  static const radiusLarge = 28.0;

  // Spacing
  static const padSmall = 8.0;
  static const pad = 16.0;
  static const padLarge = 24.0;

  // Shadow — iki katman: yakın/keskin + geniş/yumuşak, tek düz gölgeden
  // daha "tasarlanmış" bir derinlik hissi verir.
  static List<BoxShadow> get softShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.045),
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.09),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];

  // Eski isimlerin uyumluluğu — mevcut kod kırılmasın
  static const mint = primary;
  static const mintDark = primaryDark;
  static const mintLight = Color(0xFFD4F5D0);
  static const coral = danger;
  static const peach = gold;
  static const sunflower = gold;
  static const lavender = purple;
  static const sky = accent;
  static const snow = background;
  static const cloud = Color(0xFFF0F0F3);
  static const fog = Color(0xFFE8E8ED);
  static const ink = textPrimary;
  static const muted = textSecondary;
  static const soft = Color(0xFFB2BEC3);
  static const terr = danger;
  static const terrSoft = gold;
  static const line = fog;
  static const pale = mintLight;
  static const card = surface;
  static const cream = background;
  static const cream2 = cloud;
  static const forest = primaryDark;
  static const forestMid = primaryDark;
  static const white = Colors.white;
  static const radius = radiusMedium;
  static const radiusSm = radiusSmall;
  static const radiusLg = radiusLarge;
}

// Voxelo alias — eski kodla uyum
typedef Voxelo = VoxeloTokens;
