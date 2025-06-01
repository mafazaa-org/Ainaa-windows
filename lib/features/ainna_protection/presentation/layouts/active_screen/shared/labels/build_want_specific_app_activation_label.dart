import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/core/shared_widgets/app_gradient_text.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class BuildWantSpecificAppActivationLabel extends StatelessWidget {
  const BuildWantSpecificAppActivationLabel({
    super.key,
    required this.appLocalizations,
  });

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return AppGradientText(
      appLocalizations.want_specific_app_activation,
      textStyle: context.textStyles.headingMedium,
    );
  }
}
