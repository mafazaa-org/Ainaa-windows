import 'package:blocker_windows/config/dependency_injection/dependency_injection.dart';
import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/large/inactive_ainna_protection_large_layout.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InactiveAinnaProtectionHeadLayout extends StatelessWidget {
  const InactiveAinnaProtectionHeadLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChosenProtectionProvider>(
          create: (_) => getIt<ChosenProtectionProvider>(),
        ),
      ],
      child:
          context.isTabletOrDesktop
              ? InactiveAinnaProtectionLargeLayout()
              : SizedBox.shrink(),
    );
  }
}
