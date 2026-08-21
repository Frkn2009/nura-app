import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'nura_theme.dart';
import 'tokens.dart';

ThemeData buildNuraDarkTheme() {
  const scheme = ColorScheme.dark(
    primary: Color(0xFF67C9C0),
    onPrimary: Color(0xFF062F2D),
    primaryContainer: Color(0xFF164542),
    onPrimaryContainer: Color(0xFFD5F5F1),
    secondary: Color(0xFFF08D78),
    onSecondary: Color(0xFF3D0D05),
    tertiary: Color(0xFFC7B8EF),
    surface: Color(0xFF182326),
    onSurface: Color(0xFFEAF1F0),
    surfaceContainerLow: Color(0xFF141E20),
    surfaceContainer: Color(0xFF202D30),
    outline: Color(0xFF718184),
    outlineVariant: Color(0xFF36474A),
    error: Color(0xFFFFB4A9),
  );
  final base = buildNuraTheme();
  final text = base.textTheme.apply(
    bodyColor: scheme.onSurface,
    displayColor: scheme.onSurface,
  );
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Nura.radius),
  );
  return base.copyWith(
    brightness: Brightness.dark,
    colorScheme: scheme,
    scaffoldBackgroundColor: const Color(0xFF10181A),
    textTheme: text,
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: const Color(0xFF10181A),
      foregroundColor: scheme.onSurface,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: base.appBarTheme.titleTextStyle?.copyWith(
        color: scheme.onSurface,
      ),
    ),
    cardTheme: CardThemeData(
      color: scheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        side: BorderSide(color: scheme.outlineVariant),
      ),
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      fillColor: scheme.surface,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Nura.radius),
        borderSide: BorderSide(color: scheme.primary, width: 1.5),
      ),
    ),
    navigationBarTheme: base.navigationBarTheme.copyWith(
      backgroundColor: scheme.surface,
      indicatorColor: scheme.primaryContainer,
    ),
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: scheme.surface,
      selectedColor: scheme.primaryContainer,
      side: BorderSide(color: scheme.outlineVariant),
      labelStyle: TextStyle(color: scheme.onSurface),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: scheme.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Nura.radiusLg),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: scheme.surface,
      surfaceTintColor: Colors.transparent,
      showDragHandle: true,
    ),
    dividerColor: scheme.outlineVariant,
    dividerTheme: DividerThemeData(color: scheme.outlineVariant),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: scheme.primary,
        side: BorderSide(color: scheme.outline),
        minimumSize: const Size.fromHeight(52),
        shape: shape,
      ),
    ),
  );
}
