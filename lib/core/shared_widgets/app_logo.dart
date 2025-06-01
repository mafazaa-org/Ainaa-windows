import 'package:flutter/material.dart';
import 'package:blocker_windows/constants/app_images_url.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      // AssetBytesLoader('assets/images/logo.svg.vec'),
      AppImagesUrl.mainLogo,
      // semanticsLabel: 'logo',
      // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      width: 80,
      // height: 80,
    );
  }
}
