import 'package:ainaa/config/extensions/context_extension.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/inactive_screen/large/inactive_ainna_protection_large_layout.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InactiveAinnaProtectionHeadLayout extends StatefulWidget {
  const InactiveAinnaProtectionHeadLayout({super.key});

  @override
  State<InactiveAinnaProtectionHeadLayout> createState() =>
      _InactiveAinnaProtectionHeadLayoutState();
}

class _InactiveAinnaProtectionHeadLayoutState
    extends State<InactiveAinnaProtectionHeadLayout> {
  @override
  void didChangeDependencies() {
    context.read<ChosenProtectionProvider>().reset();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return context.isTabletOrDesktop
        ? InactiveAinnaProtectionLargeLayout()
        : SizedBox.shrink();
  }
}
