part of './confirm_reactivate_ainna_protection.dart';

class _BuildCheckHighProtectionLayout extends StatelessWidget {
  const _BuildCheckHighProtectionLayout(
    this.activeState,
    this.isHighProtection,
    this.appLocalizations,
  );
  final AppLocalizations appLocalizations;
  final AinaaProtectionActive activeState;
  final ValueNotifier<bool> isHighProtection;

  @override
  Widget build(BuildContext context) {
    return activeState.activationType.isHigh
        ? SizedBox.shrink()
        : ValueListenableBuilder<bool>(
          valueListenable: isHighProtection,
          builder: (context, value, _) {
            return AppCheckBoxTile(
              value: value,
              onTap: () => isHighProtection.value = !value,
              title: appLocalizations.check_high_protection,
            );
          },
        );
  }
}
