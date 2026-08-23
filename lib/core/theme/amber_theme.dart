import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'nura_theme.dart';
import 'tokens.dart';

/// Bal/amber deri — sıcak, premium bir alternatif açık tema.
class NuraAmber {
  NuraAmber._();

  static const honey = Color(0xFFC98A12);
  static const honeyDark = Color(0xFFA06D0B);
  static const honeyLight = Color(0xFFF6E3B4);
  static const cream = Color(0xFFFFFBF2);
  static const cardCream = Color(0xFFFFFDF8);
  static const border = Color(0xFFEFE2C7);
}

ThemeData buildNuraAmberTheme() {
  const scheme = ColorScheme.light(
    primary: NuraAmber.honey,
    onPrimary: Colors.white,
    primaryContainer: NuraAmber.honeyLight,
    onPrimaryContainer: NuraAmber.honeyDark,
    secondary: Nura.coral,
    onSecondary: Colors.white,
    tertiary: Nura.lavender,
    surface: NuraAmber.cardCream,
    onSurface: Nura.ink,
    surfaceContainerLow: NuraAmber.cream,
    surfaceContainer: NuraAmber.honeyLight,
    outline: NuraAmber.border,
    outlineVariant: NuraAmber.border,
    error: Color(0xFFB4453C),
  );

  final base = buildNuraTheme();
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Nura.radius),
  );

  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: NuraAmber.cream,
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: NuraAmber.cream,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    cardTheme: CardThemeData(
      color: NuraAmber.cardCream,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        side: const BorderSide(color: NuraAmber.border),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: NuraAmber.honeyDark,
        foregroundColor: Colors.white,
        disabledBackgroundColor: NuraAmber.border,
        disabledForegroundColor: Nura.soft,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: shape,
        elevation: 0,
        textStyle: base.textTheme.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: NuraAmber.honeyDark,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        side: const BorderSide(color: NuraAmber.border),
        shape: shape,
        textStyle: base.textTheme.labelLarge?.copyWith(
          color: NuraAmber.honeyDark,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: NuraAmber.honeyDark),
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      fillColor: NuraAmber.cardCream,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        borderSide: const BorderSide(color: NuraAmber.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        borderSide: const BorderSide(color: NuraAmber.honey, width: 1.5),
      ),
    ),
    navigationBarTheme: base.navigationBarTheme.copyWith(
      backgroundColor: NuraAmber.cardCream,
      indicatorColor: NuraAmber.honeyLight,
    ),
    dialogTheme: base.dialogTheme.copyWith(
      backgroundColor: NuraAmber.cardCream,
    ),
    bottomSheetTheme: base.bottomSheetTheme.copyWith(
      backgroundColor: NuraAmber.cardCream,
    ),
    dividerColor: NuraAmber.border,
    dividerTheme: const DividerThemeData(color: NuraAmber.border, thickness: 1),
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: NuraAmber.cardCream,
      selectedColor: NuraAmber.honeyLight,
      side: const BorderSide(color: NuraAmber.border),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: NuraAmber.honey,
      linearTrackColor: NuraAmber.border,
      circularTrackColor: NuraAmber.border,
    ),
  );
}
