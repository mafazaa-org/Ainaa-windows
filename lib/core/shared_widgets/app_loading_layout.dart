import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppLoadingLayout extends StatelessWidget {
  const AppLoadingLayout({super.key, this.value, this.color});
  final double? value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? context.theme.indicatorColor,
        value: value,
        constraints: BoxConstraints.tight(Size(24, 24)),
      ),
    );
  }
}
