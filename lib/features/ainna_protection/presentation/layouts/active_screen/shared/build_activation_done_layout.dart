part of 'build_content_layout.dart';

class BuildActivationDoneLayout extends StatelessWidget {
  const BuildActivationDoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.x4l,
          vertical: AppSpacing.lg,
        ),
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: AppStyles.borderRadiusML,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(AppIcons.shield, color: context.theme.scaffoldBackgroundColor),
            Text(
              ' ${appLocalizations.activation_done}',
              style: context.textStyles.headingMedium.copyWith(
                color: context.appTextTheme.mainActionLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
