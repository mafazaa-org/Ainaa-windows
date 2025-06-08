import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/core/shared_widgets/app_secondary_button.dart';
import 'package:blocker_windows/core/shared_widgets/app_text_field.dart';
import 'package:blocker_windows/core/utils/text_form_validations.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

part 'build_save_domain_button.dart';
part 'build_domain_protection_form_layout.dart';

class BuildDomainProtectionFormLayout extends StatelessWidget {
  const BuildDomainProtectionFormLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => (TextFormValidations.url(appLocalizations, value)),
      builder: (field) {
        return Column(
          spacing: AppSpacing.xs,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BuildDomainProtectionFormLayout(field: field),
            _BuildSaveDomainButton(isValid: field.isValid),
          ],
        );
      },
    );
  }
}
