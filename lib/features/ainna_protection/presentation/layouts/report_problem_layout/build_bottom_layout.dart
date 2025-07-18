part of 'build_report_problem_layout.dart';

class _BuildBottomLayout extends StatelessWidget {
  const _BuildBottomLayout({
    required this.bottomContentHeight,
    required this.horizontalSpace,
  });

  final double bottomContentHeight;
  final double horizontalSpace;

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
            Flexible(
              child: AppElevatedButton(
                onPressed: null,
                text: appLocalizations.send,
              ),
            ),
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
