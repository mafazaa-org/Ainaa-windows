import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/constants/dialog_overlay.dart';
import 'package:blocker_windows/constants/loading_overlay.dart';
import 'package:blocker_windows/core/shared_widgets/app_confirm_popup.dart';
import 'package:blocker_windows/core/shared_widgets/app_text_form_field.dart';
import 'package:blocker_windows/core/shared_widgets/show_app_snack_bar.dart';
import 'package:blocker_windows/core/utils/app_error_wrapper.dart';
import 'package:blocker_windows/core/utils/text_form_validations.dart';
import 'package:blocker_windows/features/report_problem/presentation/cubit/report_problem_cubit.dart';
import 'package:blocker_windows/features/report_problem/presentation/providers/report_problem_form_provider.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'build_name_field_layout.dart';
part 'build_the_problem_field_layout.dart';
part 'build_phone_number_field_layout.dart';
part 'build_email_address_field_layout.dart';

class BuildReportFormLayout extends StatelessWidget {
  const BuildReportFormLayout({
    super.key,
    required this.topContentHeight,
    required this.horizontalSpace,
    required this.bottomContentHeight,
    required this.formKey,
  });

  final double topContentHeight;
  final double horizontalSpace;
  final double bottomContentHeight;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final provider = context.read<ReportProblemFormProvider>();
    return BlocListener<ReportProblemCubit, ReportProblemState>(
      listener:
          (BuildContext context, state) => switch (state) {
            ReportProblemLoading() => LoadingOverlay.show(context),
            ReportProblemSent() =>
              (() {
                LoadingOverlay.hide();
                Navigator.pop(context);
                showAppSnackbar(
                  context,
                  appLocalizations.report_problem_sent,
                  4,
                );
              })(),
            ReportProblemFailed(code: final code) => DialogOverlay.show(
              context,
              child: _BuildReportProblemErrorLayout(code, appLocalizations),
            ),
            _ => (),
          },
      child: Positioned(
        top: topContentHeight + AppSpacing.md,
        left: horizontalSpace,
        right: horizontalSpace,
        bottom: bottomContentHeight,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: AppSpacing.sl,
              children: [
                _BuildNameFieldLayout(appLocalizations, provider),
                _BuildPhoneNumberFieldLayout(appLocalizations, provider),
                _BuildEmailAddressFieldLayout(appLocalizations, provider),
                _BuildTheProblemFieldLayout(appLocalizations, provider),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildReportProblemErrorLayout extends StatelessWidget {
  const _BuildReportProblemErrorLayout(this.code, this.appLocalizations);

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
