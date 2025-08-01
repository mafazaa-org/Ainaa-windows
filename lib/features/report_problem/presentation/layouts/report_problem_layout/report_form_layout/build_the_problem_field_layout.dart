part of 'build_report_form_layout.dart';

class _BuildTheProblemFieldLayout extends StatelessWidget {
  const _BuildTheProblemFieldLayout(this.appLocalizations, this.provider);

  final AppLocalizations appLocalizations;
  final ReportProblemFormProvider provider;

  @override
  Widget build(BuildContext context) {
    // final controller = TextEditingController(text:provider.getTheProblem);
    return AppTextFormField(
      label: appLocalizations.the_problem,
      hintText: appLocalizations.write_here,
      maxLines: 4,
      validator:
          (value) => TextFormValidations.paragraph(appLocalizations, value),
      onChanged: provider.setTheProblem,
    );
  }
}
