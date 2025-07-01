import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/constants/app_styles.dart';
import 'package:blocker_windows/core/shared_widgets/ainna_icon.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/active_screen/shared/content/build_protect_website.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

part '../build_activation_done_layout.dart';

class BuildContentLayout extends StatelessWidget {
  const BuildContentLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.xxl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [BuildActivationDoneLayout(), BuildProtectWebsite()],
    );
  }
}
