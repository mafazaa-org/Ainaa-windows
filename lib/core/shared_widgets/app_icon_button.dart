import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final void Function()? onPressed;
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, color: color, icon: Icon(icon));
  }
}
