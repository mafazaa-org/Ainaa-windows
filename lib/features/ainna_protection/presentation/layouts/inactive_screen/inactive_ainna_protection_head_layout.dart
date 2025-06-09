import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/large/inactive_ainna_protection_large_layout.dart';
import 'package:flutter/material.dart';

class InactiveAinnaProtectionHeadLayout extends StatelessWidget {
  const InactiveAinnaProtectionHeadLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isTabletOrDesktop
        ? InactiveAinnaProtectionLargeLayout()
        : SizedBox.shrink();
  }
}
