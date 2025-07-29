import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final void Function()? onTap;
  const AppTextButton({
    super.key,
    required this.text,
    this.textStyle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: textStyle ?? context.textStyles.textActionSecondary,
      ),
    );
  }
}
