import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/constants/app_icons.dart';
import 'package:flutter/material.dart';

class BuildCardIconLayout extends StatelessWidget {
  const BuildCardIconLayout({required this.isSelected, super.key});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Icon(
      isSelected ? AppIcons.selected : AppIcons.unselected,
      size: 20,
      color: context.theme.primaryColor,
    );
  }
}
