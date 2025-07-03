import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/constants/app_styles.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/active_screen/shared/domain_protection_layout/build_specific_domain_protection_layout.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/active_screen/shared/labels/build_want_specific_app_activation_label.dart';
import 'package:flutter/material.dart';

class BuildProtectWebsite extends StatelessWidget {
  const BuildProtectWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * .6,
      padding: EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: AppStyles.borderRadiusM,
        border: Border.all(color: context.theme.dividerColor),
      ),
      child: Column(
        spacing: AppSpacing.xl,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BuildWantSpecificAppActivationLabel(),
          BuildDomainProtectionFormLayout(),
        ],
      ),
    );
  }
}
