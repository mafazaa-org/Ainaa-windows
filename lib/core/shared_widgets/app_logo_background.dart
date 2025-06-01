import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_images_url.dart';
import 'package:flutter/material.dart';

class AppLogoBackground extends StatelessWidget {
  const AppLogoBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;
    final width = context.screenWidth;

    return Image.asset(
      AppImagesUrl.backgroundLogo,
      width: width * .9,
      height: height * .6,
      fit: BoxFit.contain,
    );
  }
}
