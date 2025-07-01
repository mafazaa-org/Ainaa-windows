import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/features/support/presentation/layouts/large/support_large_page.dart';
import 'package:flutter/material.dart';

class SupportHeadPage extends StatelessWidget {
  const SupportHeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.isTabletOrDesktop ? SupportLargePage() : SizedBox.shrink(),
    );
  }
}
