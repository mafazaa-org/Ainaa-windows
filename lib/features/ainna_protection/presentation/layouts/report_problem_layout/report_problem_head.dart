import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/report_problem_layout/build_report_problem_layout.dart';
import 'package:flutter/material.dart';

void showReportProblem(BuildContext context) {
  // needs StatefulBuilder to prevent "context disposed error" when the screen width
  // changes when screen width changes
  if (context.isTabletOrDesktop) {
    showDialog(
      context: context,
      builder:
          (_) => StatefulBuilder(
            builder:
                (context, setState) =>
                    context.isTabletOrDesktop
                        ? Dialog(
                          child: BuildReportProblemLayout(
                            height: context.screenHeight * .7,
                            width: context.screenHeight * .6,
                          ),
                        )
                        : SizedBox.shrink(),
          ),
    );
  }
}
