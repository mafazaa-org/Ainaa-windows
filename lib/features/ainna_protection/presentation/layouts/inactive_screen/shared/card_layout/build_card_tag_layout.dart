import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/constants/app_spacing.dart';
import 'package:Ainaa/constants/app_styles.dart';
import 'package:Ainaa/core/types/localized_string.dart';
import 'package:flutter/material.dart';

class BuildCardTagLayout extends StatelessWidget {
  final LocalizedString tag;
  const BuildCardTagLayout(this.tag, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sl,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: AppStyles.borderRadiusM,
      ),
      child: Text(
        tag.get(),
        style: context.textStyles.bodySmall.copyWith(color: theme.primaryColor),
      ),
    );
  }
}
