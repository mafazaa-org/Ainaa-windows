part of 'build_report_form_layout.dart';

class _BuildNameFieldLayout extends StatelessWidget {
  const _BuildNameFieldLayout(this.appLocalizations, this.provider);

  final AppLocalizations appLocalizations;
  final ReportProblemFormProvider provider;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: appLocalizations.name,
      hintText: appLocalizations.please_enter_name,
      validator: (value) => TextFormValidations.name(appLocalizations, value),
      onChanged: provider.setName,
    );
  }
}
