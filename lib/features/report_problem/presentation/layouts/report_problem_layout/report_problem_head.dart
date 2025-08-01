import 'package:blocker_windows/config/dependency_injection/dependency_injection.dart';
import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/features/report_problem/presentation/cubit/report_problem_cubit.dart';
import 'package:blocker_windows/features/report_problem/presentation/layouts/report_problem_layout/build_report_problem_layout.dart';
import 'package:blocker_windows/features/report_problem/presentation/providers/report_problem_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void showReportProblem(BuildContext context) {
  // needs StatefulBuilder to prevent "context disposed error" when the screen width
  // changes when screen width changes
  if (context.isTabletOrDesktop) {
    showDialog(
      context: context,
      builder:
          (_) => BlocProvider<ReportProblemCubit>(
            create: (_) => getIt<ReportProblemCubit>(),
            child: ChangeNotifierProvider<ReportProblemFormProvider>(
              create: (_) => ReportProblemFormProvider(),
              child: StatefulBuilder(
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
            ),
          ),
    );
  }
}
