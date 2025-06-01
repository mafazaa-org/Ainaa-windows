import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/active_screen/large/active_ainna_protection_large_screen.dart';
import 'package:flutter/material.dart';

class ActiveAinnaProtectionHeadLayout extends StatelessWidget {
  const ActiveAinnaProtectionHeadLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isTabletOrDesktop
        ? ActiveAinnaProtectionLargeLayout()
        : SizedBox.shrink();
  }
}
