import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppGradientText extends StatelessWidget {
  final String text;
  final Gradient? gradient;
  final TextStyle textStyle;
  const AppGradientText(
    this.text, {
    required this.textStyle,
    this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn, // to apply gradient to text pixels
      shaderCallback:
          (gradient ?? context.appTextTheme.gradientText).createShader,
      child: Text(text, style: textStyle),
    );
  }
}
