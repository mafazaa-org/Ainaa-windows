part of 'content/build_content_layout.dart';

class BuildActivationDoneLayout extends StatelessWidget {
  const BuildActivationDoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final ValueNotifier<bool> isHovering = ValueNotifier(false);
    return MouseRegion(
      onEnter: (_) => isHovering.value = true,
      onExit: (_) => isHovering.value = false,
      child: ElevatedButton(
        onPressed: () => context.read<AinaaProtectionCubit>().reactivate(),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
          shape: RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusML),
        ),
        child: Container(
          width: context.screenWidth * .6,
          constraints: BoxConstraints(minWidth: 370, maxWidth: 400),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.x4l,
            vertical: AppSpacing.md,
          ),
          // decoration: BoxDecoration(
          //   color: context.theme.primaryColor,
          //   borderRadius: AppStyles.borderRadiusML,
          // ),
          child: Row(
            spacing: AppSpacing.xs,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AinnaIcon(),
              ValueListenableBuilder<bool>(
                valueListenable: isHovering,
                builder: (context, isHovering, _) {
                  return Text(
                    isHovering
                        ? appLocalizations.reactivate_protection
                        : appLocalizations.activation_done,
                    style: context.textStyles.headingMedium.copyWith(
                      color: context.appTextColors.textActionPrimary,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
