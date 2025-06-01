part of 'labels_layouts.dart';

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
              child: GestureDetector(
                onTap: () {
                  showReportProblem(context);
                },
                child: Text(
                  ' ${appLocalizations.tel_us}',
                  style: context.textStyles.secondaryActionLabel,
                ),
              ),
              alignment: PlaceholderAlignment.middle,
            ),
          ],
        ),
      ),
    );
  }
}
