import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/constants/app_icons.dart';
import 'package:Ainaa/constants/app_spacing.dart';
import 'package:Ainaa/constants/app_styles.dart';
import 'package:Ainaa/core/shared_widgets/app_gradient_text.dart';
import 'package:Ainaa/core/shared_widgets/app_elevated_button.dart';
import 'package:Ainaa/features/ainna_protection/presentation/layouts/report_problem_layout/report_form_layout/build_report_form_layout.dart';
import 'package:Ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

part 'build_top_layout.dart';
part 'build_bottom_layout.dart';

class BuildReportProblemLayout extends StatelessWidget {
  final double height;
  final double width;
  final bool isPopUp;
  const BuildReportProblemLayout({
    required this.height,
    required this.width,
    this.isPopUp = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final topContentHeight = height * .15;
    final bottomContentHeight = height * .2;
    final horizontalSpace = AppSpacing.md;

    final formKey = GlobalKey<FormState>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          alignment: Alignment.center,
          width: width,
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: AppStyles.borderRadiusM,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _BuildTopLayout(
                horizontalSpace: horizontalSpace,
                topContentHeight: topContentHeight,
                isPopUp: isPopUp,
              ),
              BuildReportFormLayout(
                topContentHeight: topContentHeight,
                horizontalSpace: horizontalSpace,
                bottomContentHeight: bottomContentHeight,
                formKey: formKey,
              ),
              _BuildBottomLayout(
                bottomContentHeight: bottomContentHeight,
                horizontalSpace: horizontalSpace,
              ),
            ],
          ),
        );
      },
    );
  }
}
