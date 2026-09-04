import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'voxelith_theme.dart';
import 'tokens.dart';

/// Efsane — ödüllü, "premium" bir alternatif tema (koyu + açık varyant).
/// Diğer temalar gibi sadece renk/gölge katmanında kalır; ekran kodlarına
/// dokunmaz.
class VoxelithLegendaryPalette {
  const VoxelithLegendaryPalette({
    required this.brightness,
    required this.void_,
    required this.surface,
    required this.surfaceRaised,
    required this.violet,
    required this.violetDeep,
    required this.gold,
    required this.cyan,
    required this.border,
    required this.ink,
    required this.muted,
    required this.onAccent,
  });

  final Brightness brightness;
  final Color void_;
  final Color surface;
  final Color surfaceRaised;
  final Color violet;
  final Color violetDeep;
  final Color gold;
  final Color cyan;
  final Color border;
  final Color ink;
  final Color muted;

  /// Altın zemin üstündeki metin/ikon rengi.
  final Color onAccent;

  static const dark = VoxelithLegendaryPalette(
    brightness: Brightness.dark,
    void_: Color(0xFF0B0A17),
    surface: Color(0xFF171530),
    surfaceRaised: Color(0xFF211E42),
    violet: Color(0xFF8B5CF6),
    violetDeep: Color(0xFF6D28D9),
    gold: Color(0xFFFFC800),
    cyan: Color(0xFF22D3EE),
    border: Color(0x3D8B5CF6), // violet @ 24%
    ink: Color(0xFFF3F1FF),
    muted: Color(0xFFAFA9D6),
    onAccent: Color(0xFF3D2E00),
  );

  static const light = VoxelithLegendaryPalette(
    brightness: Brightness.light,
    void_: Color(0xFFF6F3FF),
    surface: Colors.white,
    surfaceRaised: Color(0xFFEEE7FF),
    violet: Color(0xFF7C3AED),
    violetDeep: Color(0xFF5B21B6),
    gold: Color(0xFFE69800),
    cyan: Color(0xFF0891B2),
    border: Color(0x267C3AED), // violet @ 15%
    ink: Color(0xFF251E3D),
    muted: Color(0xFF6E6689),
    onAccent: Colors.white,
  );
}

ThemeData buildVoxelithLegendaryTheme([
  VoxelithLegendaryPalette p = VoxelithLegendaryPalette.dark,
]) {
  final scheme = ColorScheme(
    brightness: p.brightness,
    primary: p.violet,
    onPrimary: Colors.white,
    primaryContainer: p.violetDeep,
    onPrimaryContainer: p.brightness == Brightness.dark
        ? const Color(0xFFEAE0FF)
        : Colors.white,
    secondary: p.gold,
    onSecondary: p.onAccent,
    tertiary: p.cyan,
    onTertiary: Colors.white,
    surface: p.surface,
    onSurface: p.ink,
    surfaceContainerLow: p.void_,
    surfaceContainer: p.surfaceRaised,
    outline: p.border,
    outlineVariant: p.border,
    error: p.brightness == Brightness.dark
        ? const Color(0xFFFF8A80)
        : const Color(0xFFC0362C),
    onError: Colors.white,
  );

  final base = buildVoxelithTheme();
  final text = base.textTheme.apply(bodyColor: p.ink, displayColor: p.ink);
  const pillShape = StadiumBorder();
  final cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Voxelith.radiusMedium),
    side: BorderSide(color: p.border),
  );

  return base.copyWith(
    brightness: p.brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: p.void_,
    cardColor: p.surface,
    textTheme: text,
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: p.void_,
      foregroundColor: p.ink,
      systemOverlayStyle: p.brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      titleTextStyle: base.appBarTheme.titleTextStyle?.copyWith(color: p.ink),
    ),
    cardTheme: CardThemeData(
      color: p.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
      shadowColor: p.violet.withValues(
        alpha: p.brightness == Brightness.dark ? 0.45 : 0.18,
      ),
      margin: EdgeInsets.zero,
      shape: cardShape,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: p.violet,
        foregroundColor: Colors.white,
        disabledBackgroundColor: p.surfaceRaised,
        disabledForegroundColor: p.muted,
        minimumSize: const Size.fromHeight(56),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: pillShape,
        elevation: 6,
        shadowColor: p.violet.withValues(
          alpha: p.brightness == Brightness.dark ? 0.55 : 0.3,
        ),
        textStyle: text.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: p.brightness == Brightness.dark
            ? p.gold
            : p.violetDeep,
        minimumSize: const Size.fromHeight(56),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        side: BorderSide(color: p.border, width: 1.5),
        shape: pillShape,
        textStyle: text.labelLarge?.copyWith(
          color: p.brightness == Brightness.dark ? p.gold : p.violetDeep,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: p.brightness == Brightness.dark
            ? p.cyan
            : p.violetDeep,
        shape: pillShape,
      ),
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      fillColor: p.surface,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelith.radius),
        borderSide: BorderSide(color: p.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelith.radius),
        borderSide: BorderSide(color: p.violet, width: 1.5),
      ),
    ),
    navigationBarTheme: base.navigationBarTheme.copyWith(
      backgroundColor: p.surface,
      indicatorColor: p.brightness == Brightness.dark
          ? p.violetDeep
          : p.surfaceRaised,
      labelTextStyle: WidgetStatePropertyAll(
        text.labelSmall?.copyWith(color: p.ink, fontWeight: FontWeight.w700),
      ),
    ),
    // NavigationRail (geniş ekran) varsayılan göstergesi renk şemasının
    // secondaryContainer'ını kullanır — bunu elle vermezsek altın/sarı
    // secondary'den türeyip markaya uymayan bir renk sızdırıyordu.
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: p.surface,
      indicatorColor: p.brightness == Brightness.dark
          ? p.violetDeep
          : p.surfaceRaised,
      selectedIconTheme: IconThemeData(color: p.ink),
      unselectedIconTheme: IconThemeData(color: p.muted),
      selectedLabelTextStyle: TextStyle(
        color: p.ink,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelTextStyle: TextStyle(color: p.muted),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: p.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelith.radiusLarge),
        side: BorderSide(color: p.border),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: p.surface,
      surfaceTintColor: Colors.transparent,
      showDragHandle: true,
    ),
    dividerColor: p.border,
    dividerTheme: DividerThemeData(color: p.border),
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: p.surfaceRaised,
      selectedColor: p.violetDeep,
      side: BorderSide(color: p.border),
      labelStyle: TextStyle(color: p.ink),
    ),
    snackBarTheme: base.snackBarTheme.copyWith(
      backgroundColor: p.surfaceRaised,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: p.gold,
      linearTrackColor: p.surfaceRaised,
      circularTrackColor: p.surfaceRaised,
    ),
  );
}

ThemeData buildVoxelithLegendaryLightTheme() =>
    buildVoxelithLegendaryTheme(VoxelithLegendaryPalette.light);
