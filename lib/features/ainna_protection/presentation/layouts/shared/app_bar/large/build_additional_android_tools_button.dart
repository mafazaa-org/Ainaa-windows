part of 'app_bar_large_layout.dart';

class _BuildAdditionalAndroidToolsButton extends StatelessWidget {
  const _BuildAdditionalAndroidToolsButton();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final appLocalizations = AppLocalizations.of(context)!;

    return GestureDetector(
      // for debugging purposes
      // onTap: () => context.read<AinaaProtectionCubit>().resetState(),
      child: Container(
        alignment: AlignmentDirectional.centerEnd,
        width: screenWidth * .25,
        // child: Text(
        //   'Test Reset',
        //   // appLocalizations.additional_android_tools,
        //   style: context.textStyles.navLabel,
        // ),
      ),
    );
  }
}
