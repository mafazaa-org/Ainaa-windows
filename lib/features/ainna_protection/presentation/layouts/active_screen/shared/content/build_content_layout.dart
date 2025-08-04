import 'package:ainaa/constants/app_spacing.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/active_screen/reactivate_layout/reactive_ainna_protection_layout.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/active_screen/shared/content/build_protect_website.dart';
import 'package:flutter/material.dart';

class BuildContentLayout extends StatelessWidget {
  const BuildContentLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.xxl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ReactiveAinnaProtectionLayout(), BuildProtectWebsite()],
    );
  }
}
