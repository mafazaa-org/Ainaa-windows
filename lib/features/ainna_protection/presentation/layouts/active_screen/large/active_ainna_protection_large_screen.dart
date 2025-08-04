import 'package:ainaa/constants/app_images_url.dart';
import 'package:ainaa/constants/app_spacing.dart';
import 'package:ainaa/core/shared_widgets/app_version_layout.dart';
import 'package:ainaa/core/shared_widgets/app_logo_background.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/active_screen/shared/content/build_content_layout.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/shared/found_unprotected_site_label.dart';
import 'package:flutter/material.dart';

class ActiveAinnaProtectionLargeLayout extends StatelessWidget {
  const ActiveAinnaProtectionLargeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.x4l),
      child: Column(
        spacing: AppSpacing.xs,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [AppLogoBackground(), BuildContentLayout()],
          ),
          FoundUnprotectedSiteLabel(),
          Spacer(),
          Expanded(child: Image.asset(AppImagesUrl.ainnaSlogan)),
          // Spacer(),
          AppVersionLayout(),
        ],
      ),
    );
  }
}
