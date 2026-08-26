import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tokens.dart';

/// Başlıklarda Sora (karakterli, geometrik), gövde metinde Manrope
/// (okunaklı, sıcak) — sistem fontu "Inter" hissini kesen premium çift.
/// İkisi de assets/fonts altında paketlenir; google_fonts'un çalışma
/// zamanında internetten font indirmesi offline-first mimariyi bozuyordu.
TextStyle voxeloDisplay({
  required FontWeight fontWeight,
  required double fontSize,
  double? height,
  double? letterSpacing,
  Color? color,
}) => TextStyle(
  fontFamily: 'Sora',
  fontWeight: fontWeight,
  fontSize: fontSize,
  height: height,
  letterSpacing: letterSpacing,
  color: color,
);

TextStyle voxeloBody({
  required FontWeight fontWeight,
  required double fontSize,
  double? height,
  double? letterSpacing,
  Color? color,
}) => TextStyle(
  fontFamily: 'Manrope',
  fontWeight: fontWeight,
  fontSize: fontSize,
  height: height,
  letterSpacing: letterSpacing,
  color: color,
);

ThemeData buildVoxeloTheme() {
  final text = TextTheme(
    displayLarge: voxeloDisplay(
      fontWeight: FontWeight.w700,
      fontSize: 34,
      height: 1.12,
      letterSpacing: -1,
      color: Voxelo.ink,
    ),
    displayMedium: voxeloDisplay(
      fontWeight: FontWeight.w700,
      fontSize: 28,
      height: 1.16,
      letterSpacing: -.6,
      color: Voxelo.ink,
    ),
    headlineMedium: voxeloDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      height: 1.25,
      letterSpacing: -.25,
      color: Voxelo.ink,
    ),
    titleLarge: voxeloDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 1.3,
      color: Voxelo.ink,
    ),
    titleMedium: voxeloBody(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.35,
      color: Voxelo.ink,
    ),
    bodyLarge: voxeloBody(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      color: Voxelo.ink,
    ),
    bodyMedium: voxeloBody(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.5,
      color: Voxelo.muted,
    ),
    labelLarge: voxeloBody(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: .1,
      color: Colors.white,
    ),
    labelSmall: voxeloBody(
      fontWeight: FontWeight.w600,
      fontSize: 11,
      letterSpacing: .7,
      color: Voxelo.mintDark,
    ),
  );

  const scheme = ColorScheme.light(
    primary: Voxelo.mint,
    onPrimary: Colors.white,
    primaryContainer: Voxelo.mintLight,
    onPrimaryContainer: Voxelo.mintDark,
    secondary: Voxelo.coral,
    onSecondary: Colors.white,
    tertiary: Voxelo.lavender,
    surface: Voxelo.white,
    onSurface: Voxelo.ink,
    surfaceContainerLow: Voxelo.snow,
    surfaceContainer: Voxelo.cloud,
    outline: Voxelo.fog,
    outlineVariant: Voxelo.fog,
    error: Color(0xFFB4453C),
  );

  final controlShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Voxelo.radius),
  );

  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Manrope',
    scaffoldBackgroundColor: Voxelo.snow,
    colorScheme: scheme,
    textTheme: text,
    visualDensity: VisualDensity.standard,
    splashFactory: InkSparkle.splashFactory,
    appBarTheme: AppBarTheme(
      backgroundColor: Voxelo.snow,
      foregroundColor: Voxelo.ink,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 60,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: voxeloDisplay(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Voxelo.ink,
      ),
    ),
    cardTheme: CardThemeData(
      color: Voxelo.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelo.radius),
        side: const BorderSide(color: Voxelo.fog),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Voxelo.mintDark,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Voxelo.fog,
        disabledForegroundColor: Voxelo.soft,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: controlShape,
        elevation: 0,
        textStyle: text.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Voxelo.mintDark,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        side: const BorderSide(color: Voxelo.fog),
        shape: controlShape,
        textStyle: text.labelLarge?.copyWith(color: Voxelo.mintDark),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Voxelo.mintDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Voxelo.radiusSm),
        ),
        textStyle: voxeloBody(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Voxelo.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelo.radius),
        borderSide: const BorderSide(color: Voxelo.fog),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelo.radius),
        borderSide: const BorderSide(color: Voxelo.fog),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelo.radius),
        borderSide: const BorderSide(color: Voxelo.mint, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelo.radius),
        borderSide: const BorderSide(color: Voxelo.coral),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 68,
      elevation: 0,
      backgroundColor: Voxelo.white,
      surfaceTintColor: Colors.transparent,
      indicatorColor: Voxelo.mintLight,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelo.radiusSm),
      ),
      labelTextStyle: WidgetStatePropertyAll(
        voxeloBody(fontWeight: FontWeight.w600, fontSize: 11),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: Voxelo.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelo.radiusLg),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Voxelo.white,
      surfaceTintColor: Colors.transparent,
      showDragHandle: true,
    ),
    dividerColor: Voxelo.fog,
    dividerTheme: const DividerThemeData(color: Voxelo.fog, thickness: 1),
    chipTheme: ChipThemeData(
      backgroundColor: Voxelo.white,
      selectedColor: Voxelo.mintLight,
      side: const BorderSide(color: Voxelo.fog),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      labelStyle: voxeloBody(
        color: Voxelo.ink,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelo.radiusSm),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Voxelo.ink,
      contentTextStyle: voxeloBody(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelo.radiusSm),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Voxelo.mint,
      linearTrackColor: Voxelo.fog,
      circularTrackColor: Voxelo.fog,
    ),
  );
}
