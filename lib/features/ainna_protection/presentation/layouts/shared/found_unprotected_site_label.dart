import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/core/shared_widgets/app_text_button.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/report_problem_layout/report_problem_head.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class FoundUnprotectedSiteLabel extends StatelessWidget {
  const FoundUnprotectedSiteLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Center(
      child: Text.rich(
        TextSpan(
          text: appLocalizations.found_problem_ques,
          style: context.textStyles.bodyLarge,
          children: [
            WidgetSpan(
              child: AppTextButton(
                onTap: () {
                  showReportProblem(context);
                },
                text: ' ${appLocalizations.tel_us}',
              ),
              alignment: PlaceholderAlignment.middle,
            ),
          ],
        ),
      ),
    );
  }
}
