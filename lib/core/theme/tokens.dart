import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NuraTokens {
  static const Color bg = Color(0xFFF7F7F7);
  static const Color primary = Color(0xFF58CC02);
  static const Color accent = Color(0xFF1CB0F6);
  static const Color danger = Color(0xFFFF4B4B);
  static const Color gold = Color(0xFFFFC800);
  static const Color textDark = Color(0xFF3C3C3C);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color muted = Color(0xFF777777);
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
      secondary: NuraTokens.accent,
      error: NuraTokens.danger,
      surface: NuraTokens.surface,
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
      elevation: 3,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: NuraTokens.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w800),
      ),
    ),
  );
}
