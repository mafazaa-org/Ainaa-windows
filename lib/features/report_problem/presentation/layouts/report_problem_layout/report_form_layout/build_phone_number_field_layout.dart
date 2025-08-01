part of 'build_report_form_layout.dart';

class _BuildPhoneNumberFieldLayout extends StatelessWidget {
  const _BuildPhoneNumberFieldLayout(this.appLocalizations, this.provider);

  final AppLocalizations appLocalizations;
  final ReportProblemFormProvider provider;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: appLocalizations.phone_number,
      hintText: appLocalizations.please_enter_phone_number,
      validator:
          (value) => TextFormValidations.phoneNumber(appLocalizations, value),
      onChanged: provider.setPhoneNumber,
    );
  }
}
