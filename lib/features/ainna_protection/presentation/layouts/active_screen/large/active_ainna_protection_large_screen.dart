import 'package:blocker_windows/core/shared_widgets/app_logo_background.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/active_screen/shared/build_content_layout.dart';
import 'package:flutter/material.dart';

class ActiveAinnaProtectionLargeLayout extends StatelessWidget {
  const ActiveAinnaProtectionLargeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [AppLogoBackground(), BuildContentLayout()],
    );
  }
}
