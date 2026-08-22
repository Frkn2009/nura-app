import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/models/models.dart';
import 'tokens.dart';

/// V1.4 tema seçicisi: Mint (varsayılan marka) | Indigo (#4F46E5).
///
/// Kapsam notu: indigo, Material tema yüzeylerini (renk şeması, butonlar,
/// giriş, navigasyon, ilerleme) değiştirir. Token seviyesindeki Nura.mint
/// referansları (ekran içi ikonlar, vurgular) P2'de tam çift-token temasına
/// taşınana kadar mint kalır — bkz. docs/DEVIR_DOSYASI.md.
class _NuraAccent {
  const _NuraAccent({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.button,
    required this.accentFg,
    required this.focus,
    required this.navIndicator,
  });

  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color button;
  final Color accentFg;
  final Color focus;
  final Color navIndicator;
}

_NuraAccent _lightAccent(NuraThemeStyle style) => switch (style) {
      NuraThemeStyle.mint => const _NuraAccent(
            primary: Nura.mint,
            onPrimary: Colors.white,
            primaryContainer: Nura.mintLight,
            onPrimaryContainer: Nura.mintDark,
            button: Nura.mintDark,
            accentFg: Nura.mintDark,
            focus: Nura.mint,
            navIndicator: Nura.mintLight,
          ),
      NuraThemeStyle.indigo => const _NuraAccent(
            primary: Nura.indigo,
            onPrimary: Colors.white,
            primaryContainer: Nura.indigoLight,
            onPrimaryContainer: Nura.indigoDeep,
            button: Nura.indigoDark,
            accentFg: Nura.indigoDark,
            focus: Nura.indigo,
            navIndicator: Nura.indigoLight,
          ),
    };

ThemeData buildNuraTheme({NuraThemeStyle style = NuraThemeStyle.mint}) {
  const text = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 34,
      height: 1.12, letterSpacing: -1, color: Nura.ink,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 28,
      height: 1.16, letterSpacing: -.6, color: Nura.ink,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 22,
      height: 1.25, letterSpacing: -.25, color: Nura.ink,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 18,
      height: 1.3, color: Nura.ink,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 16,
      height: 1.35, color: Nura.ink,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16,
      height: 1.5, color: Nura.ink,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 14,
      height: 1.5, color: Nura.muted,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 14,
      letterSpacing: .1, color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 11,
      letterSpacing: .7, color: Nura.mintDark,
    ),
  );

  final accent = _lightAccent(style);
  const schemeBase = ColorScheme.light(
    primary: Nura.mint,
    onPrimary: Colors.white,
    primaryContainer: Nura.mintLight,
    onPrimaryContainer: Nura.mintDark,
    secondary: Nura.coral,
    onSecondary: Colors.white,
    tertiary: Nura.lavender,
    surface: Nura.white,
    onSurface: Nura.ink,
    surfaceContainerLow: Nura.snow,
    surfaceContainer: Nura.cloud,
    outline: Nura.fog,
    outlineVariant: Nura.fog,
    error: Color(0xFFB4453C),
  );
  final scheme = schemeBase.copyWith(
    primary: accent.primary,
    onPrimary: accent.onPrimary,
    primaryContainer: accent.primaryContainer,
    onPrimaryContainer: accent.onPrimaryContainer,
  );

  final controlShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Nura.radius),
  );

  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: Nura.snow,
    colorScheme: scheme,
    textTheme: text,
    visualDensity: VisualDensity.standard,
    splashFactory: InkSparkle.splashFactory,
    appBarTheme: const AppBarTheme(
      backgroundColor: Nura.snow,
      foregroundColor: Nura.ink,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 60,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        fontFamily: 'Inter', fontWeight: FontWeight.w600,
        fontSize: 16, color: Nura.ink,
      ),
    ),
    cardTheme: CardThemeData(
      color: Nura.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        side: const BorderSide(color: Nura.fog),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: accent.button,
        foregroundColor: accent.onPrimary,
        disabledBackgroundColor: Nura.fog,
        disabledForegroundColor: Nura.soft,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: controlShape,
        elevation: 0,
        textStyle: text.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: accent.accentFg,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        side: const BorderSide(color: Nura.fog),
        shape: controlShape,
        textStyle: text.labelLarge?.copyWith(color: accent.accentFg),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: accent.accentFg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Nura.radiusSm),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 14,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Nura.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        borderSide: const BorderSide(color: Nura.fog),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        borderSide: const BorderSide(color: Nura.fog),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        borderSide: BorderSide(color: accent.focus, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        borderSide: const BorderSide(color: scheme.error),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 68,
      elevation: 0,
      backgroundColor: Nura.white,
      surfaceTintColor: Colors.transparent,
      indicatorColor: accent.navIndicator,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Nura.radiusSm),
      ),
      labelTextStyle: const WidgetStatePropertyAll(
        TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 11),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: Nura.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Nura.radiusLg),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Nura.white,
      surfaceTintColor: Colors.transparent,
      showDragHandle: true,
    ),
    dividerColor: Nura.fog,
    dividerTheme: const DividerThemeData(color: Nura.fog, thickness: 1),
    chipTheme: ChipThemeData(
      backgroundColor: Nura.white,
      selectedColor: accent.primaryContainer,
      side: const BorderSide(color: Nura.fog),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      labelStyle: const TextStyle(
        fontFamily: 'Inter', color: Nura.ink,
        fontWeight: FontWeight.w500, fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Nura.radiusSm),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Nura.ink,
      contentTextStyle: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Nura.radiusSm),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: accent.focus,
      linearTrackColor: Nura.fog,
      circularTrackColor: Nura.fog,
    ),
  );
}
