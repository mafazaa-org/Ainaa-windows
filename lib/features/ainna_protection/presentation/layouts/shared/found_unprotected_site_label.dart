import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/constants/app_styles.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/report_problem_layout/report_problem_head.dart';
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
        spacing: AppSpacing.xs,
        children: [
          Text(
            appLocalizations.found_problem_ques,
            style: context.textStyles.bodyLarge,
          ),
          Material(
            child: InkWell(
              onTap: () => showReportProblem(context),
              hoverColor: context.theme.hoverColor,
              borderRadius: AppStyles.borderRadiusXS,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: Text(
                  appLocalizations.tel_us,
                  style: context.textStyles.textActionSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
