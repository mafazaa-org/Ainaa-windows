import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/constants/app_spacing.dart';
import 'package:Ainaa/constants/app_styles.dart';
import 'package:Ainaa/core/shared_widgets/ainna_icon.dart';
import 'package:Ainaa/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart';
import 'package:Ainaa/features/ainna_protection/presentation/layouts/active_screen/shared/content/build_protect_website.dart';
import 'package:Ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part '../build_activation_done_layout.dart';

class BuildContentLayout extends StatelessWidget {
  const BuildContentLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.xxl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [BuildActivationDoneLayout(), BuildProtectWebsite()],
    );
  }
}
