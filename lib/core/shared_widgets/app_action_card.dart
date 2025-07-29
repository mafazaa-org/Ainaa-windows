import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/constants/app_spacing.dart';
import 'package:Ainaa/constants/app_styles.dart';
import 'package:Ainaa/core/shared_widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';

class AppActionCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String actionLabel;
  final void Function()? onPressed;
  final double? width;
  const AppActionCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.actionLabel,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: width,
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.lg,
        ),
        decoration: _boxDecoration(context),
        child: Column(
          spacing: AppSpacing.md,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: title,
                style: context.textStyles.displayMedium,
                children: [
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(text: subTitle, style: context.textStyles.bodySmall),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 200,
              child: AppElevatedButton(text: actionLabel, onPressed: onPressed),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: AppStyles.borderRadiusM,
      color: context.theme.scaffoldBackgroundColor,
      boxShadow: [
        AppStyles.boxPrimaryShadow(
          color: context.theme.primaryColor.withAlpha(25),
        ),
      ],
    );
  }
}
