import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/constants/app_styles.dart';
import 'package:flutter/material.dart';

void showAppSnackbar(
  BuildContext context,
  String message, [
  int? durationInSeconds,
]) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder:
        (context) => Positioned(
          bottom: AppSpacing.minHorizontal,
          // left: AppSpacing.minHorizontal,
          right: AppSpacing.minHorizontal,
          width: context.screenWidth * .25,
          child: Material(
            elevation: 8,
            borderRadius: AppStyles.borderRadiusM,
            color: context.theme.snackBarTheme.backgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sl,
              ),
              child: Text(message, style: context.textStyles.displayMedium),
            ),
          ),
        ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(Duration(seconds: durationInSeconds ?? 2), () {
    overlayEntry.remove();
  });
}
