part of 'build_report_form_layout.dart';

class _BuildEmailAddressFieldLayout extends StatelessWidget {
  const _BuildEmailAddressFieldLayout(this.appLocalizations);

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: appLocalizations.email_address,
      hintText: appLocalizations.please_enter_email_address,
      validator:
          (value) => TextFormValidations.emailAddress(appLocalizations, value),
      onChanged: (value) {},
    );
  }
}
