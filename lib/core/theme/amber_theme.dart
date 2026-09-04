import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'voxelith_theme.dart';
import 'tokens.dart';

/// Bal/amber deri — sıcak, premium bir alternatif açık tema.
class VoxelithAmber {
  VoxelithAmber._();

  static const honey = Color(0xFFC98A12);
  static const honeyDark = Color(0xFFA06D0B);
  static const honeyLight = Color(0xFFF6E3B4);
  static const cream = Color(0xFFFFFBF2);
  static const cardCream = Color(0xFFFFFDF8);
  static const border = Color(0xFFEFE2C7);
}

ThemeData buildVoxelithAmberTheme() {
  const scheme = ColorScheme.light(
    primary: VoxelithAmber.honey,
    onPrimary: Colors.white,
    primaryContainer: VoxelithAmber.honeyLight,
    onPrimaryContainer: VoxelithAmber.honeyDark,
    secondary: Voxelith.coral,
    onSecondary: Colors.white,
    tertiary: Voxelith.lavender,
    surface: VoxelithAmber.cardCream,
    onSurface: Voxelith.ink,
    surfaceContainerLow: VoxelithAmber.cream,
    surfaceContainer: VoxelithAmber.honeyLight,
    outline: VoxelithAmber.border,
    outlineVariant: VoxelithAmber.border,
    error: Color(0xFFB4453C),
  );

  final base = buildVoxelithTheme();
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Voxelith.radius),
  );

  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: VoxelithAmber.cream,
    cardColor: VoxelithAmber.cardCream,
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: VoxelithAmber.cream,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    cardTheme: CardThemeData(
      color: VoxelithAmber.cardCream,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelith.radius),
        side: const BorderSide(color: VoxelithAmber.border),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: VoxelithAmber.honeyDark,
        foregroundColor: Colors.white,
        disabledBackgroundColor: VoxelithAmber.border,
        disabledForegroundColor: Voxelith.soft,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: shape,
        elevation: 0,
        textStyle: base.textTheme.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: VoxelithAmber.honeyDark,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        side: const BorderSide(color: VoxelithAmber.border),
        shape: shape,
        textStyle: base.textTheme.labelLarge?.copyWith(
          color: VoxelithAmber.honeyDark,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: VoxelithAmber.honeyDark),
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      fillColor: VoxelithAmber.cardCream,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelith.radius),
        borderSide: const BorderSide(color: VoxelithAmber.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelith.radius),
        borderSide: const BorderSide(color: VoxelithAmber.honey, width: 1.5),
      ),
    ),
    navigationBarTheme: base.navigationBarTheme.copyWith(
      backgroundColor: VoxelithAmber.cardCream,
      indicatorColor: VoxelithAmber.honeyLight,
    ),
    dialogTheme: base.dialogTheme.copyWith(
      backgroundColor: VoxelithAmber.cardCream,
    ),
    bottomSheetTheme: base.bottomSheetTheme.copyWith(
      backgroundColor: VoxelithAmber.cardCream,
    ),
    dividerColor: VoxelithAmber.border,
    dividerTheme: const DividerThemeData(
      color: VoxelithAmber.border,
      thickness: 1,
    ),
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: VoxelithAmber.cardCream,
      selectedColor: VoxelithAmber.honeyLight,
      side: const BorderSide(color: VoxelithAmber.border),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: VoxelithAmber.honey,
      linearTrackColor: VoxelithAmber.border,
      circularTrackColor: VoxelithAmber.border,
    ),
  );
}
