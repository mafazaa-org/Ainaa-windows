part of 'package:blocker_windows/features/ainna_protection/presentation/layouts/active_screen/reactivate_layout/reactive_ainna_protection_layout.dart';

class ReactiveAinnaProtectionLargeLayout extends StatelessWidget {
  final AinaaProtectionActive activeState;
  const ReactiveAinnaProtectionLargeLayout(this.activeState, {super.key});
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final actionColor = context.theme.primaryColor;
    return Column(
      spacing: AppSpacing.sm,
      children: [
        Text(
          '${appLocalizations.activation_done} ${activeState.activationType.arLabel}',
          style: context.textStyles.bodyHuge,
        ),
        AppTextButton(
          onTap: () {
            confirmReactivateAinnaProtection(context, activeState: activeState);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppSpacing.sm,
            children: [
              Icon(AppIcons.reload, size: 20, color: actionColor),
              Text(
                appLocalizations.reactivate_protection,
                style: context.textStyles.displayLarge.copyWith(
                  color: actionColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
