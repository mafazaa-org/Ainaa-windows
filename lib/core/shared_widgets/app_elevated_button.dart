import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/constants/app_spacing.dart';
import 'package:Ainaa/constants/app_styles.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final double? height;
  final double width;
  final String text;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  const AppElevatedButton({
    this.height,
    this.width = double.maxFinite,
    required this.text,
    this.textStyle,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(top: AppSpacing.sl),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
          shape: RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusM),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ?? context.textStyles.mainActionSmallLabel,
        ),
      ),
    );
  }
}
