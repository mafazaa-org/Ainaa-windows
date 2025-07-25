import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/core/shared_widgets/app_logo.dart';
import 'package:blocker_windows/core/shared_widgets/sharpe_line_painter.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart';
import 'package:blocker_windows/features/support/presentation/pages/support_head_page.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'build_additional_android_tools_button.dart';
part 'build_support_us_button.dart';

class AppBarLargeLayout extends StatelessWidget {
  const AppBarLargeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .9,
      child: Column(
        spacing: AppSpacing.md,
        children: [
          SizedBox(height: AppSpacing.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _BuildSupportUsButton(),
              Flexible(child: AppLogo()),
              _BuildAdditionalAndroidToolsButton(),
            ],
          ),
          CustomPaint(
            size: Size(double.maxFinite, 0.5), // Width x Height
            painter: SharpLinePainter(
              context.theme.secondaryHeaderColor,
              context.theme.scaffoldBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
