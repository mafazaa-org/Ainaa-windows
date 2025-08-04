import 'package:flutter/material.dart';
import 'package:ainaa/constants/app_images_url.dart';

class AppLogo extends StatelessWidget {
  final bool useAlternative;
  const AppLogo({super.key, this.useAlternative = false});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      // AssetBytesLoader('assets/images/logo.svg.vec'),
      useAlternative
          ? AppImagesUrl.ainnaAlternativeLogo
          : AppImagesUrl.mainLogo,
      // semanticsLabel: 'logo',
      // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      width: 80,
      // height: 80,
    );
  }
}
