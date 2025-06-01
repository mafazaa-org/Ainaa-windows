import 'package:flutter/material.dart';

class AppBoxShadows {
  // Basic Shadow
  static const BoxShadow basic = BoxShadow(
    color: Colors.black26,
    offset: Offset(2, 2),
    blurRadius: 4,
    spreadRadius: 1,
  );

  // Soft Shadow
  static const BoxShadow soft = BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 4),
    blurRadius: 10,
    spreadRadius: 0,
  );

  // Sharp Shadow
  static const BoxShadow sharp = BoxShadow(
    color: Colors.black38,
    offset: Offset(4, 4),
    blurRadius: 0,
    spreadRadius: 0,
  );

  // Large Spread Shadow
  static const BoxShadow largeSpread = BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 0),
    blurRadius: 10,
    spreadRadius: 5,
  );

  // Inner Shadow (Workaround)
  static const BoxShadow inner = BoxShadow(
    color: Colors.black38,
    offset: Offset(0, 0),
    blurRadius: 10,
    spreadRadius: -5,
  );

  // Multiple Shadows
  static List<BoxShadow> multiple = [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(2, 2),
      blurRadius: 4,
      spreadRadius: 1,
    ),
    BoxShadow(
      color: Colors.black12,
      offset: Offset(-2, -2),
      blurRadius: 4,
      spreadRadius: 1,
    ),
  ];

  // Colored Shadow
  static BoxShadow colored(Color color) => BoxShadow(
    color: color.withAlpha((color.a * 0.3).round()),
    offset: Offset(4, 4),
    blurRadius: 10,
    spreadRadius: 2,
  );

  // Floating Shadow
  static const BoxShadow floating = BoxShadow(
    color: Colors.black38,
    offset: Offset(10, 10),
    blurRadius: 20,
    spreadRadius: 2,
  );

  // Minimal Shadow
  static const BoxShadow minimal = BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
  );

  // Neon Glow Effect
  static BoxShadow neonGlow(Color color) => BoxShadow(
    color: color.withAlpha((color.a * 0.5).round()),
    offset: Offset(0, 0),
    blurRadius: 20,
    spreadRadius: 5,
  );

  AppBoxShadows._();
}
