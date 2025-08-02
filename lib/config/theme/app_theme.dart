import 'package:blocker_windows/constants/app_colors.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/constants/app_styles.dart';
import 'package:blocker_windows/constants/app_text_colors.dart';
import 'package:blocker_windows/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class AppTheme {
  static ThemeData get light {
    final appColors = AppColors.light;

    final inputBorder = OutlineInputBorder(
      borderRadius: AppStyles.borderRadiusXS,
      borderSide: BorderSide.none,
    );
    final enabledBorder = AppStyles.outlineInputBorderXS(
      color: appColors.mediumOverlay,
    );
    final focusedBorder = AppStyles.outlineInputBorderXS(
      color: appColors.darkOverlay,
    );
    final disabledBorder = AppStyles.outlineInputBorderXS(
      color: appColors.lightOverlay,
    );
    final errorBorder = AppStyles.outlineInputBorderXS(color: appColors.error);
    final focusedErrorBorder = AppStyles.outlineInputBorderXS(
      color: appColors.errorOnFocused,
    );

    final appBarTheme = AppBarTheme(
      // color: appColors.background,
      backgroundColor: appColors.background,
      surfaceTintColor: appColors.background,
      elevation: 0,
      // scrolledUnderElevation:,
      // shadowColor:,
      // surfaceTintColor:,
      // shape:,
      // iconTheme:,
      // actionsIconTheme:,
      // centerTitle:,
      //   titleSpacing:,
      toolbarHeight: 24.sp,
      // toolbarTextStyle:,
      // titleTextStyle:,
      // systemOverlayStyle:,
      // actionsPadding:,
    );
    final chipThemeData = ChipThemeData(
      showCheckmark: false,
      // color: WidgetStateProperty.all(appColors.transparent),
      // selectedColor: appColors.secondary.withAlpha(150),
      selectedColor: appColors.primary.withAlpha(8),
      selectedShadowColor: appColors.transparent,
      disabledColor: appColors.transparent,
      surfaceTintColor: appColors.transparent,
      backgroundColor: appColors.transparent,
      checkmarkColor: appColors.transparent,
      shadowColor: appColors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: appColors.darkOverlay, width: 1.0),
        borderRadius: AppStyles.borderRadiusXS,
      ),
    );
    final inputDecorationTheme = InputDecorationTheme(
      fillColor: appColors.background,
      border: inputBorder,
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      disabledBorder: disabledBorder,
      errorMaxLines: 4,
      errorBorder: errorBorder,
      focusedErrorBorder: focusedErrorBorder,
    );
    final textSelectionTheme = TextSelectionThemeData(
      cursorColor: appColors.primary,
      selectionColor: appColors.primary.withAlpha(150),
      selectionHandleColor: appColors.secondary,
    );
    final elevatedButtonThemeData = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: appColors.primary,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.sl),
        shape: RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusML),
      ),
    );
    final iconThemeData = IconThemeData(color: appColors.onPrimary);
    final iconButtonTheme = IconButtonThemeData(
      style: IconButton.styleFrom(
        // backgroundColor: appColors.onPrimary,
        foregroundColor: appColors.onPrimary,
      ),
    );

    return ThemeData(
      fontFamily: 'Almarai',
      primaryColor: appColors.primary,
      primarySwatch: appColors.primary,
      scaffoldBackgroundColor: appColors.background,
      splashColor: appColors.transparent,
      highlightColor: appColors.transparent,
      // remove ripple effect
      splashFactory: NoSplash.splashFactory,
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusM),
      ),
      inputDecorationTheme: inputDecorationTheme,
      textSelectionTheme: textSelectionTheme,
      appBarTheme: appBarTheme,
      chipTheme: chipThemeData,
      canvasColor: appColors.transparent,
      hoverColor: appColors.lightOverlay,
      shadowColor: appColors.darkOverlay,
      cardColor: appColors.secondary,
      hintColor: appColors.thinOverlay,
      dividerColor: appColors.darkOverlay,
      elevatedButtonTheme: elevatedButtonThemeData,
      iconTheme: iconThemeData,
      iconButtonTheme: iconButtonTheme,
      secondaryHeaderColor: appColors.decoration,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.mediumOverlay,
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: TextButton.styleFrom(
      //     minimumSize: Size.zero, // allows text to control height
      //     padding: EdgeInsets.zero,
      //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //   ),
      // ),
      extensions: <ThemeExtension<dynamic>>[
        AppColors.light,
        AppTextColors.light,
        AppTextStyles(AppTextColors.light),
      ],
    );
  }

  const AppTheme._();
}
