import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/models/models.dart';
import 'nura_theme.dart';
import 'tokens.dart';

ColorScheme _darkScheme(NuraThemeStyle style) {
  final accent = switch (style) {
    NuraThemeStyle.mint => const (
        Color(0xFF67C9C0),
        Color(0xFF062F2D),
        Color(0xFF164542),
        Color(0xFFD5F5F1),
      ),
    NuraThemeStyle.indigo => const (
        Nura.indigoGlow,
        Nura.indigoDeep,
        Color(0xFF312E81),
        Nura.indigoLight,
      ),
  };
  return ColorScheme.dark(
    primary: accent.$1,
    onPrimary: accent.$2,
    primaryContainer: accent.$3,
    onPrimaryContainer: accent.$4,
    secondary: const Color(0xFFF08D78),
    onSecondary: const Color(0xFF3D0D05),
    tertiary: const Color(0xFFC7B8EF),
    surface: const Color(0xFF182326),
    onSurface: const Color(0xFFEAF1F0),
    surfaceContainerLow: const Color(0xFF141E20),
    surfaceContainer: const Color(0xFF202D30),
    outline: const Color(0xFF718184),
    outlineVariant: const Color(0xFF36474A),
    error: const Color(0xFFFFB4A9),
  );
}

ThemeData buildNuraDarkTheme({NuraThemeStyle style = NuraThemeStyle.mint}) {
  final scheme = _darkScheme(style);
  final base = buildNuraTheme(style: style);
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
