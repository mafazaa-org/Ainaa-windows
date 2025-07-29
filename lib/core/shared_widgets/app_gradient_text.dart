import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppTextGradientPrimary extends StatelessWidget {
  final String text;
  final Gradient? gradient;
  final TextStyle textStyle;
  const AppTextGradientPrimary(
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
          (gradient ?? context.appTextColors.textGradientPrimary).createShader,
      child: Text(text, style: textStyle),
    );
  }
}
