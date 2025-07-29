import 'package:Ainaa/constants/app_images_url.dart';
import 'package:Ainaa/constants/app_spacing.dart';
import 'package:Ainaa/core/shared_widgets/app_logo_background.dart';
import 'package:Ainaa/features/ainna_protection/presentation/layouts/active_screen/shared/content/build_content_layout.dart';
import 'package:Ainaa/features/ainna_protection/presentation/layouts/shared/found_unprotected_site_label.dart';
import 'package:flutter/material.dart';

class ActiveAinnaProtectionLargeLayout extends StatelessWidget {
  const ActiveAinnaProtectionLargeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.x4l, bottom: AppSpacing.md),
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
        ],
      ),
    );
  }
}
