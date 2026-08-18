import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tokens.dart';

ThemeData buildNuraTheme() {
  const text = TextTheme(
    displayLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 34, height: 1.15, color: Nura.ink),
    displayMedium: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 28, height: 1.2, color: Nura.ink),
    headlineMedium: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 22, color: Nura.ink),
    titleLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 18, color: Nura.ink),
    titleMedium: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 16, color: Nura.ink),
    bodyLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16, height: 1.4, color: Nura.ink),
    bodyMedium: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 14, height: 1.4, color: Nura.muted),
    labelLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 15, color: Nura.cream),
    labelSmall: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 0.6, color: Nura.terr),
  );

  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: Nura.cream,
    colorScheme: const ColorScheme.light(
      primary: Nura.forest,
      onPrimary: Nura.cream,
      secondary: Nura.terr,
      onSecondary: Nura.cream,
      surface: Nura.cream,
      onSurface: Nura.ink,
    ),
    textTheme: text,
    appBarTheme: const AppBarTheme(
      backgroundColor: Nura.cream,
      foregroundColor: Nura.ink,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 18, color: Nura.ink),
    ),
    cardTheme: CardThemeData(
      color: Nura.card,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        side: const BorderSide(color: Nura.line),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Nura.forest,
        foregroundColor: Nura.cream,
        minimumSize: const Size.fromHeight(54),
        shape: const StadiumBorder(),
        textStyle: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Nura.forest,
        minimumSize: const Size.fromHeight(54),
        side: const BorderSide(color: Nura.line),
        shape: const StadiumBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Nura.cream2,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Nura.line),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Nura.line),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Nura.forest, width: 1.4),
      ),
    ),
    dividerColor: Nura.line,
  );
}
