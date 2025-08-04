import 'package:ainaa/constants/app_spacing.dart';
import 'package:ainaa/core/shared_widgets/app_text_form_field.dart';
import 'package:ainaa/core/utils/text_form_validations.dart';
import 'package:ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

part 'build_name_field_layout.dart';
part 'build_the_problem_field_layout.dart';
part 'build_phone_number_field_layout.dart';
part 'build_email_address_field_layout.dart';

class BuildReportFormLayout extends StatelessWidget {
  const BuildReportFormLayout({
    super.key,
    required this.topContentHeight,
    required this.horizontalSpace,
    required this.bottomContentHeight,
    required this.formKey,
  });

  final double topContentHeight;
  final double horizontalSpace;
  final double bottomContentHeight;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Positioned(
      top: topContentHeight + AppSpacing.md,
      left: horizontalSpace,
      right: horizontalSpace,
      bottom: bottomContentHeight,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            spacing: AppSpacing.sl,
            children: [
              _BuildNameFieldLayout(appLocalizations),
              _BuildPhoneNumberFieldLayout(appLocalizations),
              _BuildEmailAddressFieldLayout(appLocalizations),
              _BuildTheProblemFieldLayout(appLocalizations),
            ],
          ),
        ),
      ),
    );
  }
}
