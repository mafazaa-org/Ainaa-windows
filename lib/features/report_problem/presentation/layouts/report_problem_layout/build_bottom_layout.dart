part of 'build_report_problem_layout.dart';

class _BuildBottomLayout extends StatelessWidget {
  const _BuildBottomLayout({
    required this.bottomContentHeight,
    required this.horizontalSpace,
    required this.formKey,
  });

  final double bottomContentHeight;
  final double horizontalSpace;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Positioned(
      right: horizontalSpace,
      left: horizontalSpace,
      bottom: 0,
      child: SizedBox(
        height: bottomContentHeight,
        child: Column(
          spacing: AppSpacing.sm,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: _ReportFormButton(appLocalizations, formKey)),
            Text(
              appLocalizations.will_contact_you_soon,
              style: context.textStyles.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _ReportFormButton extends StatelessWidget {
  const _ReportFormButton(this.appLocalizations, this.formKey);

  final GlobalKey<FormState> formKey;
  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    final getReportProblemData =
        context.watch<ReportProblemFormProvider>().getReportProblemData;
    return AppElevatedButton(
      onPressed: () async {
        if (getReportProblemData != null && formKey.currentState!.validate()) {
          await context.read<ReportProblemCubit>().submitProblem(
            getReportProblemData,
          );
        } else {
          DialogOverlay.show(
            context,
            child: AppDialogLayout(
              text: appLocalizations.invalid_input,
              actionText: appLocalizations.ok,
              onPressed: DialogOverlay.hide,
            ),
          );
        }
      },
      text: appLocalizations.send,
    );
  }
}
