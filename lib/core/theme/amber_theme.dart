import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'voxelo_theme.dart';
import 'tokens.dart';

/// Bal/amber deri — sıcak, premium bir alternatif açık tema.
class VoxeloAmber {
  VoxeloAmber._();

  static const honey = Color(0xFFC98A12);
  static const honeyDark = Color(0xFFA06D0B);
  static const honeyLight = Color(0xFFF6E3B4);
  static const cream = Color(0xFFFFFBF2);
  static const cardCream = Color(0xFFFFFDF8);
  static const border = Color(0xFFEFE2C7);
}

ThemeData buildVoxeloAmberTheme() {
  const scheme = ColorScheme.light(
    primary: VoxeloAmber.honey,
    onPrimary: Colors.white,
    primaryContainer: VoxeloAmber.honeyLight,
    onPrimaryContainer: VoxeloAmber.honeyDark,
    secondary: Voxelo.coral,
    onSecondary: Colors.white,
    tertiary: Voxelo.lavender,
    surface: VoxeloAmber.cardCream,
    onSurface: Voxelo.ink,
    surfaceContainerLow: VoxeloAmber.cream,
    surfaceContainer: VoxeloAmber.honeyLight,
    outline: VoxeloAmber.border,
    outlineVariant: VoxeloAmber.border,
    error: Color(0xFFB4453C),
  );

  final base = buildVoxeloTheme();
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Voxelo.radius),
  );

  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: VoxeloAmber.cream,
    cardColor: VoxeloAmber.cardCream,
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: VoxeloAmber.cream,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    cardTheme: CardThemeData(
      color: VoxeloAmber.cardCream,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelo.radius),
        side: const BorderSide(color: VoxeloAmber.border),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: VoxeloAmber.honeyDark,
        foregroundColor: Colors.white,
        disabledBackgroundColor: VoxeloAmber.border,
        disabledForegroundColor: Voxelo.soft,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: shape,
        elevation: 0,
        textStyle: base.textTheme.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: VoxeloAmber.honeyDark,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        side: const BorderSide(color: VoxeloAmber.border),
        shape: shape,
        textStyle: base.textTheme.labelLarge?.copyWith(
          color: VoxeloAmber.honeyDark,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: VoxeloAmber.honeyDark),
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      fillColor: VoxeloAmber.cardCream,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelo.radius),
        borderSide: const BorderSide(color: VoxeloAmber.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelo.radius),
        borderSide: const BorderSide(color: VoxeloAmber.honey, width: 1.5),
      ),
    ),
    navigationBarTheme: base.navigationBarTheme.copyWith(
      backgroundColor: VoxeloAmber.cardCream,
      indicatorColor: VoxeloAmber.honeyLight,
    ),
    dialogTheme: base.dialogTheme.copyWith(
      backgroundColor: VoxeloAmber.cardCream,
    ),
    bottomSheetTheme: base.bottomSheetTheme.copyWith(
      backgroundColor: VoxeloAmber.cardCream,
    ),
    dividerColor: VoxeloAmber.border,
    dividerTheme: const DividerThemeData(
      color: VoxeloAmber.border,
      thickness: 1,
    ),
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: VoxeloAmber.cardCream,
      selectedColor: VoxeloAmber.honeyLight,
      side: const BorderSide(color: VoxeloAmber.border),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: VoxeloAmber.honey,
      linearTrackColor: VoxeloAmber.border,
      circularTrackColor: VoxeloAmber.border,
    ),
  );
}
