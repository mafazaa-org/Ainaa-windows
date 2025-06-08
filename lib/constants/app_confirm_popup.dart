import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/constants/app_styles.dart';
import 'package:blocker_windows/constants/app_text_button.dart';
import 'package:flutter/material.dart';

class AppConfirmPopup extends StatelessWidget {
  final String text;
  final String? subText;
  final String actionText;
  final String cancelText;
  final void Function()? onPressed;
  final void Function()? onCancelTap;
  const AppConfirmPopup({
    super.key,
    required this.text,
    this.subText,
    required this.actionText,
    required this.onPressed,

    required this.cancelText,
    required this.onCancelTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth * .6;
    return Container(
      width: width,
      padding: EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: AppStyles.borderRadiusM,
      ),
      child: Column(
        spacing: AppSpacing.sm,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: context.textStyles.displayMedium),
          Visibility(
            visible: subText != null,
            child: Text(subText ?? '', style: context.textStyles.bodyMedium),
          ),
          SizedBox.shrink(),
          Row(
            spacing: AppSpacing.sl,
            children: [
              AppConfirmButton(onPressed: onPressed, actionText: actionText),
              AppTextButton(
                text: cancelText,
                onTap: onCancelTap,
                textStyle: context.textStyles.escapeActionLabel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppConfirmButton extends StatelessWidget {
  const AppConfirmButton({
    super.key,
    required this.onPressed,
    required this.actionText,
  });

  final void Function()? onPressed;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusXS),
      ),
      child: Text(actionText, style: context.textStyles.confirmActionLabel),
    );
  }
}
