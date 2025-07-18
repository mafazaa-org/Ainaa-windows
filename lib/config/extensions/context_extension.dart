import 'package:blocker_windows/constants/app_constants.dart';
import 'package:blocker_windows/constants/app_text_colors.dart';
import 'package:blocker_windows/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

extension ContextEx on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isDesktop =>
      screenWidth <= AppConstants.xlDesktopMinWidth &&
      screenWidth >= AppConstants.desktopMinWidth;
  bool get isTablet =>
      screenWidth <= AppConstants.largeTabletMaxWidth &&
      screenWidth >= AppConstants.smallTabletMinWidth;
  bool get isMobile =>
      screenWidth <= AppConstants.mobileMaxWidth &&
      screenWidth >= AppConstants.mobileMinWidth;
  bool get isTabletOrDesktop => isDesktop || isTablet;

  ThemeData get theme => Theme.of(this);
  AppTextColors get appTextColors => Theme.of(this).extension<AppTextColors>()!;
  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;
  // AppTextColors get AppTextColors => Theme.of(this).extension<AppTextColors>()!;
}
