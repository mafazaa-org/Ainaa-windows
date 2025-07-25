import 'package:flutter/material.dart';

@immutable
class AppTextColors extends ThemeExtension<AppTextColors> {
  final Color textPrimary;
  final Color textSecondary;
  final Color textHeading;
  final Color textActionPrimary;
  final Color textActionSecondary;
  final Color confirmActionTertiary;
  final Color errorText;
  final Color successText;
  final Color warningText;
  final Gradient textGradientPrimary;

  const AppTextColors._({
    required this.textPrimary,
    required this.textSecondary,
    required this.textHeading,
    required this.textActionPrimary,
    required this.textActionSecondary,
    required this.confirmActionTertiary,
    required this.errorText,
    required this.successText,
    required this.warningText,
    required this.textGradientPrimary,
  });

  @override
  ThemeExtension<AppTextColors> copyWith({
    Color? textPrimary,
    Color? textSecondary,
    Color? textHeading,
    Color? textActionPrimary,
    Color? textActionSecondary,
    Color? confirmActionTertiary,
    Color? errorText,
    Color? successText,
    Color? warningText,
    Gradient? textGradientPrimary,
  }) {
    return AppTextColors._(
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textHeading: textHeading ?? this.textHeading,
      textActionPrimary: textActionPrimary ?? this.textActionPrimary,
      textActionSecondary: textActionSecondary ?? this.textActionSecondary,
      confirmActionTertiary:
          confirmActionTertiary ?? this.confirmActionTertiary,
      errorText: errorText ?? this.errorText,
      successText: successText ?? this.successText,
      warningText: warningText ?? this.warningText,
      textGradientPrimary: textGradientPrimary ?? this.textGradientPrimary,
    );
  }

  static AppTextColors lerpColors(AppTextColors a, AppTextColors b, double t) {
    return AppTextColors._(
      textPrimary: Color.lerp(a.textPrimary, b.textPrimary, t)!,
      textSecondary: Color.lerp(a.textSecondary, b.textSecondary, t)!,
      textHeading: Color.lerp(a.textHeading, b.textHeading, t)!,
      textActionPrimary:
          Color.lerp(a.textActionPrimary, b.textActionPrimary, t)!,
      textActionSecondary:
          Color.lerp(a.textActionSecondary, b.textActionSecondary, t)!,
      confirmActionTertiary:
          Color.lerp(a.confirmActionTertiary, b.confirmActionTertiary, t)!,
      errorText: Color.lerp(a.errorText, b.errorText, t)!,
      successText: Color.lerp(a.successText, b.successText, t)!,
      warningText: Color.lerp(a.warningText, b.warningText, t)!,
      textGradientPrimary:
          Gradient.lerp(a.textGradientPrimary, b.textGradientPrimary, t)!,
    );
  }

  @override
  ThemeExtension<AppTextColors> lerp(
    covariant ThemeExtension<AppTextColors>? other,
    double t,
  ) {
    if (other is! AppTextColors) return this;

    return lerpColors(this, other, t);
  }

  // Optional: Define a light and dark theme
  static const light = AppTextColors._(
    textPrimary: Color(0xFFE0462D),
    textSecondary: Color(0xFF353535),
    textHeading: Color(0xFFFFFFFF),
    textActionPrimary: Color(0xFFFFFFFF),
    textActionSecondary: Color(0xFFE0462D),
    confirmActionTertiary: Color(0xFF7B7B7B),
    errorText: Colors.deepOrange,
    successText: Colors.green,
    warningText: Colors.orange,
    textGradientPrimary: LinearGradient(
      begin: Alignment.topRight,
      colors: [Color(0xFF000000), Color(0xFFEF9A9A)],
    ),
  );

  // static const dark = AppTextColors._(
  //   textPrimary: ,
  //   textSecondary: ,
  //   errorText: ,
  //   successText:,
  //   warningText: ,
  // );
}
