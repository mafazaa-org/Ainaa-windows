part of 'build_report_form_layout.dart';

class BuildEmailAddressFieldLayout extends StatelessWidget {
  const BuildEmailAddressFieldLayout(
    this.appLocalizations,
    this.provider, {
    super.key,
  });

  final AppLocalizations appLocalizations;
  final ReportProblemFormProvider provider;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: appLocalizations.email_address,
      hintText: appLocalizations.please_enter_email_address,
      validator:
          (value) => TextFormValidations.emailAddress(appLocalizations, value),
      onChanged: provider.setEmailAddress,
    );
  }
}
