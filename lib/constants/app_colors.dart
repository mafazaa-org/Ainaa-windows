import 'package:flutter/material.dart';

final class AppColors {
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

  const AppColors._({
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

  static const light = AppColors._(
    primary: primarySwatch,
    // primary: Color(0xFFE0462D),
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
    // darkerOverlay: Color(0xFFCCCCCC),
    decoration: Color(0xFFDFA197),
    onPrimary: Color(0xFF000000),
  );
}
