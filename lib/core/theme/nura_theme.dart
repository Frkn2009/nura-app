import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tokens.dart';

ThemeData buildNuraTheme() {
  const text = TextTheme(
    displayLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 34, height: 1.15, color: Nura.ink),
    displayMedium: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 28, height: 1.2, color: Nura.ink),
    headlineMedium: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 22, color: Nura.ink),
    titleLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 18, color: Nura.ink),
    titleMedium: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 16, color: Nura.ink),
    bodyLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16, height: 1.5, color: Nura.ink),
    bodyMedium: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 14, height: 1.5, color: Nura.muted),
    labelLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),
    labelSmall: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 12, letterSpacing: 0.6, color: Nura.mint),
  );

  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: Nura.snow,
    colorScheme: const ColorScheme.light(
      primary: Nura.mint,
      onPrimary: Colors.white,
      secondary: Nura.coral,
      onSecondary: Colors.white,
      tertiary: Nura.lavender,
      surface: Nura.snow,
      onSurface: Nura.ink,
    ),
    textTheme: text,
    appBarTheme: const AppBarTheme(
      backgroundColor: Nura.snow,
      foregroundColor: Nura.ink,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 18, color: Nura.ink),
    ),
    cardTheme: CardThemeData(
      color: Nura.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        side: const BorderSide(color: Nura.fog, width: 1.5),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Nura.mint,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        textStyle: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Nura.mint,
        minimumSize: const Size.fromHeight(54),
        side: const BorderSide(color: Nura.fog, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Nura.cloud,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Nura.fog),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Nura.fog),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Nura.mint, width: 2),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Nura.white,
      indicatorColor: Nura.mintLight,
      labelTextStyle: WidgetStatePropertyAll(
        const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 11),
      ),
    ),
    dividerColor: Nura.fog,
    chipTheme: ChipThemeData(
      backgroundColor: Nura.cloud,
      selectedColor: Nura.mintLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Nura.fog),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Nura.ink,
      contentTextStyle: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
