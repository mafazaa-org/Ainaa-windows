part of './confirm_reactivate_ainna_protection.dart';

class _BuildBody extends StatelessWidget {
  const _BuildBody({
    required this.activeState,

    required this.isHighProtection,
    required this.appLocalizations,
    required this.haveYoutubeProtection,
  });

  final AinaaProtectionActive activeState;
  final ValueNotifier<bool> isHighProtection;
  final AppLocalizations appLocalizations;
  final ValueNotifier<bool> haveYoutubeProtection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.sm, bottom: AppSpacing.sl),
      child: Column(
        spacing: AppSpacing.sl,
        children: [
          _BuildCheckHighProtectionLayout(
            activeState,
            isHighProtection,
            appLocalizations,
          ),
          _BuildCheckYoutubeProtectionLayout(
            activeState,
            haveYoutubeProtection,
            appLocalizations,
          ),
        ],
      ),
    );
  }
}
