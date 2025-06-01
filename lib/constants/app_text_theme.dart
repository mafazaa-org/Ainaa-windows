import 'package:flutter/material.dart';

@immutable
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final Color primaryText;
  final Color secondaryText;
  final Color mainActionLabel;
  final Color secondaryActionLabel;
  final Color errorText;
  final Color successText;
  final Color warningText;
  final Gradient gradientText;

  const AppTextTheme({
    required this.primaryText,
    required this.secondaryText,
    required this.mainActionLabel,
    required this.secondaryActionLabel,
    required this.errorText,
    required this.successText,
    required this.warningText,
    required this.gradientText,
  });

  @override
  ThemeExtension<AppTextTheme> copyWith({
    Color? primaryText,
    Color? secondaryText,
    Color? mainActionLabel,
    Color? secondaryActionLabel,
    Color? errorText,
    Color? successText,
    Color? warningText,
    Gradient? gradientText,
  }) {
    return AppTextTheme(
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      mainActionLabel: mainActionLabel ?? this.mainActionLabel,
      secondaryActionLabel: secondaryActionLabel ?? this.secondaryActionLabel,
      errorText: errorText ?? this.errorText,
      successText: successText ?? this.successText,
      warningText: warningText ?? this.warningText,
      gradientText: gradientText ?? this.gradientText,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    covariant ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) return this;

    return AppTextTheme(
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      mainActionLabel: Color.lerp(mainActionLabel, other.mainActionLabel, t)!,
      secondaryActionLabel:
          Color.lerp(secondaryActionLabel, other.secondaryActionLabel, t)!,
      errorText: Color.lerp(errorText, other.errorText, t)!,
      successText: Color.lerp(successText, other.successText, t)!,
      warningText: Color.lerp(warningText, other.warningText, t)!,
      gradientText: Gradient.lerp(gradientText, other.gradientText, t)!,
    );
  }

  // Optional: Define a light and dark theme
  static const light = AppTextTheme(
    primaryText: Color(0xFFE0462D),
    secondaryText: Color(0xFF353535),
    mainActionLabel: Color(0xFFFFFFFF),
    secondaryActionLabel: Color(0xFFE0462D),
    errorText: Colors.deepOrange,
    successText: Colors.green,
    warningText: Colors.orange,
    gradientText: LinearGradient(
      begin: Alignment.topRight,
      colors: [Color(0xFF000000), Color(0xFFEF9A9A)],
    ),
  );

  // static const dark = AppTextTheme(
  //   primaryText: ,
  //   secondaryText: ,
  //   errorText: ,
  //   successText:,
  //   warningText: ,
  // );
}
