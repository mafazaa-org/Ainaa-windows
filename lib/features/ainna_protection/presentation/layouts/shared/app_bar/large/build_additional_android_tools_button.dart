part of 'app_bar_large_layout.dart';

class _BuildAdditionalAndroidToolsButton extends StatelessWidget {
  const _BuildAdditionalAndroidToolsButton();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final appLocalizations = AppLocalizations.of(context)!;

    return Container(
      alignment: AlignmentDirectional.centerEnd,
      width: screenWidth * .25,
      child: Text(
        appLocalizations.additional_android_tools,
        style: context.textStyles.navLabel,
      ),
    );
  }
}
