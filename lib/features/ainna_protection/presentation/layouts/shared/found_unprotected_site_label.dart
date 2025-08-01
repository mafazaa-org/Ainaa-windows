import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/core/shared_widgets/app_text_button.dart';
import 'package:blocker_windows/features/report_problem/presentation/layouts/report_problem_layout/report_problem_head.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class FoundUnprotectedSiteLabel extends StatelessWidget {
  const FoundUnprotectedSiteLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        // spacing: AppSpacing.xs,
        children: [
          Text(
            appLocalizations.found_problem_ques,
            style: context.textStyles.bodyLarge,
          ),
          Material(
            child: AppTextButton(
              onTap: () => showReportProblem(context),
              text: appLocalizations.tel_us,
            ),
          ),
        ],
      ),
    );
  }
}
