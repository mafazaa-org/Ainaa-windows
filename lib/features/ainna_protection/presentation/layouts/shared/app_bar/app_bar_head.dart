import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/features/ainna_protection/presentation/layouts/shared/app_bar/large/app_bar_large_layout.dart';
import 'package:flutter/material.dart';

class AppBarHead extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  const AppBarHead(this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    return context.isTabletOrDesktop ? AppBarLargeLayout() : SizedBox.shrink();
  }

  @override
  Size get preferredSize => Size.fromHeight(
    context.isDesktop
        ? kToolbarHeight * 1.3
        : context.isTablet
        ? kToolbarHeight * 1.6
        : kToolbarHeight,
  );
}
