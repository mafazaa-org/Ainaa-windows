part of 'build_report_problem_layout.dart';

class _BuildTopLayout extends StatelessWidget {
  const _BuildTopLayout({
    required this.horizontalSpace,
    required this.topContentHeight,
    required this.isPopUp,
  });

  final double horizontalSpace;
  final double topContentHeight;
  final bool isPopUp;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Positioned(
      top: 0,
      left: horizontalSpace,
      right: horizontalSpace,
      child: SizedBox(
        height: topContentHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocalizations.report_problem,
                  style: context.textStyles.headingLarge,
                ),
                Visibility(
                  visible: isPopUp,
                  child: IconButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    icon: Icon(AppIcons.close, size: 20),
                  ),
                ),
              ],
            ),
            Divider(color: context.theme.dividerColor, thickness: 1),
          ],
        ),
      ),
    );
  }
}
