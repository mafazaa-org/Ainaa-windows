import 'package:ainaa/config/extensions/context_extension.dart';
import 'package:ainaa/constants/app_styles.dart';
import 'package:flutter/material.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    required this.onPressed,
    required this.actionText,
    this.mainAction = true,
  });

  final void Function()? onPressed;
  final String actionText;
  final bool mainAction;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textStyles = context.textStyles;
    final primaryColor = theme.primaryColor;
    final transparentColor = theme.scaffoldBackgroundColor;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: mainAction ? primaryColor : transparentColor,
        elevation: mainAction ? 1.0 : 0.0,
        shape: RoundedRectangleBorder(
          side: mainAction ? BorderSide.none : BorderSide(color: primaryColor),
          borderRadius: AppStyles.borderRadiusXS,
        ),
      ),
      child: Text(
        actionText,
        style:
            mainAction
                ? textStyles.confirmActionLabel
                : textStyles.confirmActionSecondary,
      ),
    );
  }
}
