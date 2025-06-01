part of 'build_report_form_layout.dart';

class _BuildNameFieldLayout extends StatelessWidget {
  const _BuildNameFieldLayout(this.appLocalizations);

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: appLocalizations.name,
      hintText: appLocalizations.please_enter_name,
      validator: (value) => TextFormValidations.name(appLocalizations, value),
      onChanged: (value) {},
    );
  }
}
