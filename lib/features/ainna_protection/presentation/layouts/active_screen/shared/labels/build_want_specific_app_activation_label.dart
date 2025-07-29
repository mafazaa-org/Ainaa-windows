import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class BuildWantSpecificAppActivationLabel extends StatelessWidget {
  const BuildWantSpecificAppActivationLabel({super.key});
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Text(
      appLocalizations.want_specific_app_activation,
      style: context.textStyles.headingMedium,
    );
  }
}
