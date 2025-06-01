import 'package:blocker_windows/constants/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class AppTextStyles {
  final BuildContext context;

  AppTextStyles(this.context);

  AppTextTheme get appTextTheme => Theme.of(context).extension<AppTextTheme>()!;

  TextStyle get headingExtraLarge => TextStyle(
    fontSize: 36.0.h,
    fontWeight: FontWeight.w700,
    color: appTextTheme.secondaryText,
  );

  TextStyle get headingLarge => TextStyle(
    fontSize: 32.0.h,
    fontWeight: FontWeight.w700,
    color: appTextTheme.secondaryText,
  );

  TextStyle get headingMedium => TextStyle(
    fontSize: 24.0.h,
    fontWeight: FontWeight.w700,
    color: appTextTheme.primaryText,
  );

  TextStyle get headingSmall => TextStyle(
    fontSize: 20.0.h,
    fontWeight: FontWeight.w700,
    color: appTextTheme.primaryText,
  );

  TextStyle get displayLarge => TextStyle(
    fontSize: 20.0.h,
    fontWeight: FontWeight.w700,
    color: appTextTheme.secondaryText,
  );

  TextStyle get displayMedium => TextStyle(
    fontSize: 14.0.h,
    fontWeight: FontWeight.w700,
    color: appTextTheme.secondaryText,
  );

  TextStyle get displaySmall => TextStyle(
    fontSize: 12.0.h,
    fontWeight: FontWeight.w700,
    color: Colors.black87,
  );

  TextStyle get bodyLarge => TextStyle(
    fontSize: 16.0.h,
    fontWeight: FontWeight.w400,
    color: appTextTheme.secondaryText,
  );

  TextStyle get bodyMedium => TextStyle(
    fontSize: 14.0.h,
    fontWeight: FontWeight.w400,
    color: appTextTheme.secondaryText,
  );

  TextStyle get bodySmall => TextStyle(
    fontSize: 12.0.h,
    fontWeight: FontWeight.w400,
    color: appTextTheme.secondaryText,
  );

  TextStyle get caption => TextStyle(
    fontSize: 12.0.h,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
  );

  TextStyle get mainActionLabel => TextStyle(
    fontSize: 32.0.h,
    fontWeight: FontWeight.w700,
    color: appTextTheme.mainActionLabel,
  );

  TextStyle get mainActionSmallLabel =>
      mainActionLabel.copyWith(fontSize: 20.0.h);

  TextStyle get secondaryActionLabel => TextStyle(
    fontSize: 16.0.h,
    fontWeight: FontWeight.w700,
    color: appTextTheme.secondaryActionLabel,
  );

  TextStyle get navLabel => TextStyle(
    fontSize: 20.0.h,
    color: appTextTheme.secondaryText,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );
}
