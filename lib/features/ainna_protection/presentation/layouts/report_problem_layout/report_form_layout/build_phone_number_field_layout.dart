part of 'build_report_form_layout.dart';

class _BuildPhoneNumberFieldLayout extends StatelessWidget {
  const _BuildPhoneNumberFieldLayout(this.appLocalizations);

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: appLocalizations.phone_number,
      hintText: appLocalizations.please_enter_phone_number,
      validator:
          (value) => TextFormValidations.phoneNumber(appLocalizations, value),
      onChanged: (value) {},
    );
  }
}
