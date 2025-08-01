import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_text_colors.dart'; // Ensure this points to your AppTextColors class

@immutable
class AppTextStyles extends ThemeExtension<AppTextStyles> {
  final AppTextColors appTextColors;

  const AppTextStyles(this.appTextColors);

  TextStyle get headingHuge => TextStyle(
    fontSize: 64.0.h,
    fontWeight: FontWeight.w700,
    color: appTextColors.textHeading,
  );

  TextStyle get headingExtraLarge => TextStyle(
    fontSize: 36.0.h,
    fontWeight: FontWeight.w700,
    color: appTextColors.textSecondary,
  );

  TextStyle get headingLarge => TextStyle(
    fontSize: 32.0.h,
    fontWeight: FontWeight.w700,
    color: appTextColors.textSecondary,
  );

  TextStyle get headingMedium => TextStyle(
    fontSize: 24.0.h,
    fontWeight: FontWeight.w700,
    color: appTextColors.textSecondary,
  );

  TextStyle get headingSmall => TextStyle(
    fontSize: 20.0.h,
    fontWeight: FontWeight.w700,
    color: appTextColors.textPrimary,
  );

  TextStyle get displayLarge => TextStyle(
    fontSize: 20.0.h,
    fontWeight: FontWeight.w700,
    color: appTextColors.textSecondary,
  );

  TextStyle get displayMedium => TextStyle(
    fontSize: 18.0.h,
    fontWeight: FontWeight.w700,
    color: appTextColors.textSecondary,
  );

  TextStyle get displaySmall => TextStyle(
    fontSize: 12.0.h,
    fontWeight: FontWeight.w700,
    color: appTextColors.textSecondary,
  );

  TextStyle get bodyLarge => TextStyle(
    fontSize: 16.0.h,
    fontWeight: FontWeight.w400,
    color: appTextColors.textSecondary,
  );

  TextStyle get bodyMedium => TextStyle(
    fontSize: 14.0.h,
    fontWeight: FontWeight.w400,
    color: appTextColors.textSecondary,
  );

  TextStyle get bodySmall => TextStyle(
    fontSize: 12.0.h,
    fontWeight: FontWeight.w400,
    color: appTextColors.textSecondary,
  );

  TextStyle get caption => TextStyle(
    fontSize: 12.0.h,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
  );

  TextStyle get textActionPrimary => TextStyle(
    fontSize: 32.0.h,
    fontWeight: FontWeight.w700,
    color: appTextColors.textActionPrimary,
  );

  TextStyle get mainActionSmallLabel =>
      textActionPrimary.copyWith(fontSize: 20.0.h);

  TextStyle get textActionSecondary => TextStyle(
    fontSize: 16.0.h,
    fontWeight: FontWeight.w700,
    color: appTextColors.textActionSecondary,
  );

  TextStyle get confirmActionLabel => TextStyle(
    fontSize: 14.0.h,
    fontWeight: FontWeight.w600,
    color: appTextColors.textActionPrimary,
  );

  TextStyle get confirmActionSecondary =>
      confirmActionLabel.copyWith(color: appTextColors.textActionSecondary);

  TextStyle get confirmActionTertiary =>
      confirmActionLabel.copyWith(color: appTextColors.confirmActionTertiary);

  TextStyle get navLabel => TextStyle(
    fontSize: 20.0.h,
    color: appTextColors.textSecondary,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  @override
  AppTextStyles copyWith({AppTextColors? appTextColors}) {
    return AppTextStyles(appTextColors ?? this.appTextColors);
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) return this;

    return AppTextStyles(
      AppTextColors.lerpColors(appTextColors, other.appTextColors, t),
    );
  }
}
