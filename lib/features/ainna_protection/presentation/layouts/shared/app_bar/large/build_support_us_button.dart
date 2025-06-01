part of 'app_bar_large_layout.dart';

class _BuildSupportUsButton extends StatelessWidget {
  const _BuildSupportUsButton();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final appLocalizations = AppLocalizations.of(context)!;

    return GestureDetector(
      // for debugging purposes
      onTap: () => context.read<AinaaProtectionCubit>().resetState(),
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        width: screenWidth * .25,
        child: Text(
          appLocalizations.support_us,
          style: context.textStyles.navLabel,
        ),
      ),
    );
  }
}
