import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/constants/app_styles.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final TextStyle? textStyle;
  final void Function()? onTap;
  final Color? hoverColor;
  const AppTextButton({
    super.key,
    this.child,
    this.text,
    this.textStyle,
    required this.onTap,
    this.hoverColor,
  }) : assert(child != null || text != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: hoverColor ?? context.theme.hoverColor,
      borderRadius: AppStyles.borderRadiusXXS,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.xs),
        child:
            child ??
            Text(
              text ?? '',
              style: textStyle ?? context.textStyles.textActionSecondary,
            ),
      ),
    );
  }
}
