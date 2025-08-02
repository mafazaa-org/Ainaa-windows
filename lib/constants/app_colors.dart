import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final MaterialColor primary;
  final Color secondary;
  final Color background;
  final Color error;
  final Color errorOnFocused;
  final Color valid;
  final Color transparent;
  final Color thinOverlay;
  final Color lightOverlay;
  final Color mediumOverlay;
  final Color darkOverlay;
  final Color decoration;
  final Color onPrimary;

  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.error,
    required this.errorOnFocused,
    required this.valid,
    required this.transparent,
    required this.thinOverlay,
    required this.lightOverlay,
    required this.mediumOverlay,
    required this.darkOverlay,
    required this.decoration,
    required this.onPrimary,
  });

  /// Copy method required for ThemeExtension
  @override
  AppColors copyWith({
    MaterialColor? primary,
    Color? secondary,
    Color? background,
    Color? error,
    Color? errorOnFocused,
    Color? valid,
    Color? transparent,
    Color? thinOverlay,
    Color? lightOverlay,
    Color? mediumOverlay,
    Color? darkOverlay,
    Color? decoration,
    Color? onPrimary,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      error: error ?? this.error,
      errorOnFocused: errorOnFocused ?? this.errorOnFocused,
      valid: valid ?? this.valid,
      transparent: transparent ?? this.transparent,
      thinOverlay: thinOverlay ?? this.thinOverlay,
      lightOverlay: lightOverlay ?? this.lightOverlay,
      mediumOverlay: mediumOverlay ?? this.mediumOverlay,
      darkOverlay: darkOverlay ?? this.darkOverlay,
      decoration: decoration ?? this.decoration,
      onPrimary: onPrimary ?? this.onPrimary,
    );
  }

  /// Required for ThemeExtension
  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primary: primary, // MaterialColor not interpolated
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorOnFocused: Color.lerp(errorOnFocused, other.errorOnFocused, t)!,
      valid: Color.lerp(valid, other.valid, t)!,
      transparent: transparent, // transparent stays the same
      thinOverlay: Color.lerp(thinOverlay, other.thinOverlay, t)!,
      lightOverlay: Color.lerp(lightOverlay, other.lightOverlay, t)!,
      mediumOverlay: Color.lerp(mediumOverlay, other.mediumOverlay, t)!,
      darkOverlay: Color.lerp(darkOverlay, other.darkOverlay, t)!,
      decoration: Color.lerp(decoration, other.decoration, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
    );
  }

  static const MaterialColor primarySwatch =
      MaterialColor(0xFFE0462D, <int, Color>{
        50: Color(0xFFFFEBEE),
        100: Color(0xFFFFCDD2),
        200: Color(0xFFEF9A9A),
        300: Color(0xFFE57373),
        400: Color(0xFFEF5350),
        500: Color(0xFFE0462D),
        600: Color(0xFFD84315),
        700: Color(0xFFC62828),
        800: Color(0xFFB71C1C),
        900: Color(0xFFB71C1C),
      });

  static const AppColors light = AppColors(
    primary: primarySwatch,
    secondary: Color(0xFFFFF0EE),
    background: Color(0xFFFFFFFF),
    error: Color(0xFFB00020),
    errorOnFocused: Color.fromARGB(255, 136, 0, 25),
    valid: Color.fromARGB(255, 54, 179, 143),
    transparent: Colors.transparent,
    thinOverlay: Color(0xFF7B7B7B),
    lightOverlay: Color(0xFFFAFAFA),
    mediumOverlay: Color(0xFFDCDCDC),
    darkOverlay: Color(0xFFC9C9C9),
    decoration: Color(0xFFDFA197),
    onPrimary: Color(0xFF000000),
  );
}
