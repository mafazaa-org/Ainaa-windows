import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/constants.dart';
import 'package:blocker_windows/core/shared_widgets/app_logo_background.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/shared/phone_number_form/build_phone_number_form_layout.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/shared/shared.dart';
import 'package:flutter/material.dart';
part 'build_choose_protection_level_large_layout.dart';
part 'build_protect_your_device_form.dart';

class InactiveAinnaProtectionLargeLayout extends StatelessWidget {
  const InactiveAinnaProtectionLargeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AppLogoBackground(),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * .05,
            vertical: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSpacing.md,
            children: [
              ChooseProtectionLevelLabel(),
              Column(
                spacing: AppSpacing.x4l,
                children: [
                  _BuildChooseProtectionLevelLargeLayout(),
                  _BuildProtectYourDeviceForm(width),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
