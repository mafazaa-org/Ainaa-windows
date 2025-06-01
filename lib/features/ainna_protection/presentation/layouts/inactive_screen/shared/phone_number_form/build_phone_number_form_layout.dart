import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/core/shared_widgets/app_text_field.dart';
import 'package:blocker_windows/core/utils/text_form_validations.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/shared/build_ainna_protection_button.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_phone_number_text_filed_layout.dart';

class BuildPhoneNumberFormLayout extends StatelessWidget {
  const BuildPhoneNumberFormLayout({super.key, required this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            context.isMobile
                ? AppSpacing.sm
                : context.isTablet
                ? width * .15
                : width * .25,
      ),
      child: FormField<String>(
        autovalidateMode: AutovalidateMode.onUnfocus,
        validator:
            (value) =>
                (TextFormValidations.phoneNumber(appLocalizations, value)),
        builder: (FormFieldState<String> field) {
          return Column(
            spacing: AppSpacing.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildPhoneNumberTextFiledLayout(field),
              SizedBox(height: AppSpacing.md),
              BuildAinnaProtectionButton(field.isValid),
            ],
          );
        },
      ),
    );
  }
}
