part of './confirm_reactivate_ainna_protection.dart';

class _BuildCheckYoutubeProtectionLayout extends StatelessWidget {
  const _BuildCheckYoutubeProtectionLayout(
    this.activeState,
    this.haveYoutubeProtection,
    this.appLocalizations,
  );
  final AppLocalizations appLocalizations;
  final AinaaProtectionActive activeState;
  final ValueNotifier<bool> haveYoutubeProtection;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: haveYoutubeProtection,
      builder: (context, value, _) {
        return AppCheckBoxTile(
          value: value,
          onTap: () => haveYoutubeProtection.value = !value,
          title: appLocalizations.check_youtube_protection,
          subTitle: appLocalizations.check_cant_undo,
        );
      },
    );
  }
}
