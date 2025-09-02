part of 'build_report_form_layout.dart';

class BuildReportProblemErrorLayout extends StatelessWidget {
  const BuildReportProblemErrorLayout(
    this.code,
    this.appLocalizations, {
    super.key,
  });

  final String code;
  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return AppDialogLayout(
      text: AppErrorWrapper.map(code, appLocalizations),
      actionText: appLocalizations.ok,
      onPressed: () {
        LoadingOverlay.hide();
        DialogOverlay.hide();
      },
    );
  }
}
