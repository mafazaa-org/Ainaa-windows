import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/features/support/presentation/layouts/large/support_large_page.dart';
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
