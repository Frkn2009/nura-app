import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// NURA tasarım dili — tek doğru renk/font kaynağı.
/// Hardcode renk yasak; her şey buradan gelir.
class NuraTokens {
  // ── Ana palet ────────────────────────────────────────────
  static const Color bg = Color(0xFFF7F7F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF58CC02);
  static const Color primaryDark = Color(0xFF46A302);
  static const Color accent = Color(0xFF1CB0F6);
  static const Color accentDark = Color(0xFF1899D6);
  static const Color danger = Color(0xFFFF4B4B);
  static const Color gold = Color(0xFFFFC800);
  static const Color goldDark = Color(0xFFE6B400);
  static const Color purple = Color(0xFF9B72CF);
  static const Color mint = Color(0xFF2EC4B6);
  static const Color coral = Color(0xFFFF6B6B);

  // ── Metin ────────────────────────────────────────────────
  static const Color textDark = Color(0xFF3C3C3C);
  static const Color textPrimary = Color(0xFF3C3C3C); // eski uyumluluk
  static const Color textSecondary = Color(0xFF777777); // eski uyumluluk
  static const Color muted = Color(0xFF777777);

  // ── Zemin / kenarlık ─────────────────────────────────────
  static const Color background = Color(0xFFF7F7F7); // eski uyumluluk
  static const Color cardBorder = Color(0xFFE8E8E8);

  // ── Yumuşak (pastel) dolgular ────────────────────────────
  static const Color softGreen = Color(0xFFEAF7E0);
  static const Color softBlue = Color(0xFFE3F4FD);
  static const Color softGold = Color(0xFFFFF6D6);
  static const Color softCoral = Color(0xFFFFEBEB);
  static const Color softPurple = Color(0xFFF0E9FA);

  // ── ESKİ EKRAN UYUMLULUĞU (eski `Nura` paleti) ───────────
  // Mevcut ekranlar (başarım, reklam, klan, oyun vb.) hâlâ eski
  // isimleri kullanıyor; derleme kırılmasın diye korunuyor.
  // Yeni kod NuraTokens üzerinden yazılır; eski ekranlar
  // zamanla yeni isimlere geçirilir.
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

  // Radius — eski isimler
  static const radiusSm = 12.0;
  static const radius = 20.0;
  static const radiusLg = 28.0;
}

/// Eski kod uyumu — mevcut ekranlar `Nura.` ile erişir.
typedef Nura = NuraTokens;

/// Gradyanlar — kutlama, ödül ve vurgu anları için.
class NuraGradients {
  static const LinearGradient primary = LinearGradient(
    colors: [Color(0xFF6BE514), Color(0xFF46A302)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient accent = LinearGradient(
    colors: [Color(0xFF3EC7FF), Color(0xFF1899D6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient gold = LinearGradient(
    colors: [Color(0xFFFFD93D), Color(0xFFE6B400)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient purple = LinearGradient(
    colors: [Color(0xFFB48CF0), Color(0xFF7C4DBF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient coral = LinearGradient(
    colors: [Color(0xFFFF8A8A), Color(0xFFFF4B4B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient hero = LinearGradient(
    colors: [Color(0xFF58CC02), Color(0xFF1CB0F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

ThemeData buildNuraTheme() {
  final base = GoogleFonts.nunitoTextTheme().apply(
    bodyColor: NuraTokens.textDark,
    displayColor: NuraTokens.textDark,
  );
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: NuraTokens.bg,
    colorScheme: const ColorScheme.light(
      primary: NuraTokens.primary,
      onPrimary: Colors.white,
      secondary: NuraTokens.accent,
      onSecondary: Colors.white,
      error: NuraTokens.danger,
      onError: Colors.white,
      surface: NuraTokens.surface,
      onSurface: NuraTokens.textDark,
    ),
    textTheme: base,
    appBarTheme: AppBarTheme(
      backgroundColor: NuraTokens.bg,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: NuraTokens.textDark,
      ),
      iconTheme: const IconThemeData(color: NuraTokens.textDark),
    ),
    cardTheme: CardThemeData(
      color: NuraTokens.surface,
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.06),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: NuraTokens.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(56),
        elevation: 3,
        shadowColor: NuraTokens.primaryDark.withValues(alpha: 0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w800),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: NuraTokens.accent,
        minimumSize: const Size.fromHeight(52),
        side: BorderSide(color: NuraTokens.accent.withValues(alpha: 0.5), width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w800),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: NuraTokens.accent,
        textStyle: GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.w800),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: NuraTokens.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: NuraTokens.cardBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: NuraTokens.cardBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: NuraTokens.accent, width: 2),
      ),
      labelStyle: GoogleFonts.nunito(color: NuraTokens.muted, fontWeight: FontWeight.w600),
      hintStyle: GoogleFonts.nunito(color: NuraTokens.muted.withValues(alpha: 0.7)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: NuraTokens.surface,
      selectedColor: NuraTokens.softGreen,
      side: BorderSide(color: NuraTokens.cardBorder),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.w700, color: NuraTokens.textDark),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: NuraTokens.textDark,
      contentTextStyle: GoogleFonts.nunito(fontWeight: FontWeight.w700, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: NuraTokens.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      titleTextStyle: GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.w900, color: NuraTokens.textDark),
      contentTextStyle: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600, color: NuraTokens.textSecondary),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: NuraTokens.surface,
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      indicatorColor: NuraTokens.softGreen,
      height: 70,
      labelTextStyle: WidgetStatePropertyAll(
        GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w800, color: NuraTokens.textDark),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: NuraTokens.primary,
      linearTrackColor: Color(0xFFE8E8E8),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    dividerTheme: DividerThemeData(color: NuraTokens.cardBorder, thickness: 1, space: 1),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      textColor: NuraTokens.textDark,
    ),
  );
}
