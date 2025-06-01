part of 'build_report_form_layout.dart';

class _BuildTheProblemFieldLayout extends StatelessWidget {
  const _BuildTheProblemFieldLayout(this.appLocalizations);

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: appLocalizations.the_problem,
      hintText: appLocalizations.write_here,
      maxLines: 4,
      validator:
          (value) => TextFormValidations.paragraph(appLocalizations, value),
      onChanged: (value) {},
    );
  }
}
