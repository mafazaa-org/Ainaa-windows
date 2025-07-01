import 'package:blocker_windows/constants/app_images_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AinnaIcon extends StatelessWidget {
  const AinnaIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImagesUrl.ainnaIcon,
      // colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
      semanticsLabel: 'Ainna',
    );

    //return Icon(
    //   AppIcons.shield,
    //   size: 24.0,
    //   color: context.theme.scaffoldBackgroundColor,
    // ),
  }
}
