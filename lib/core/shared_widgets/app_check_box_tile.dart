import 'package:ainaa/config/extensions/context_extension.dart';
import 'package:ainaa/constants/app_icons.dart';
import 'package:ainaa/constants/app_spacing.dart';
import 'package:ainaa/constants/app_styles.dart';
import 'package:flutter/material.dart';

class AppCheckBoxTile extends StatelessWidget {
  final bool value;
  final void Function()? onTap;
  final String title;
  final String? subTitle;

  const AppCheckBoxTile({
    required this.value,
    required this.onTap,
    required this.title,
    this.subTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: AppStyles.borderBoxXXS(color: context.appColors.mediumOverlay),
        borderRadius: AppStyles.borderRadiusXS,
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sl,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            spacing: AppSpacing.md,
            children: [
              Icon(
                AppIcons.checkbox,
                size: 28,
                color:
                    value
                        ? context.theme.primaryColor
                        : context.appColors.mediumOverlay,
              ),
              Column(
                spacing: AppSpacing.xs,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textStyles.displaySmallMedium.copyWith(
                      color:
                          value
                              ? context.appTextColors.textSecondary
                              : context.appColors.thinOverlay,
                    ),
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: context.textStyles.bodySmall.copyWith(
                        color:
                            value
                                ? context.appTextColors.textSecondary
                                : context.appColors.thinOverlay,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
