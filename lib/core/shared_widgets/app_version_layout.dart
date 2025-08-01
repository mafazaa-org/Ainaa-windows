import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_constants.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class AppVersionLayout extends StatelessWidget {
  const AppVersionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSpacing.xxs),
        child: Text(
          '${AppConstants.appName} ${AppConstants.appVersion}',
          textAlign: TextAlign.center,
          style: context.textStyles.displaySmall,
        ),
      ),
    );
  }
}
