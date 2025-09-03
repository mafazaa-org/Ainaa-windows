part of 'build_specific_domain_protection_layout.dart';

void showConfirmDomainProtectionDialog(
  BuildContext context,
  AppLocalizations appLocalizations, {
  required List<String> domains,
  required void Function()? onPressed,
}) {
  showDialog(
    context: context,
    builder:
        (context) => Dialog(
          child: AppDialogLayout(
            title: SizedBox(
              width: double.maxFinite,
              child: Column(
                spacing: AppSpacing.xs,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalizations.confirm_specific_app_activation,
                    style: context.textStyles.displayMedium,
                  ),
                  Text(
                    domains.reduce((value, element) => '$value, $element'),
                    style: context.textStyles.displayMedium,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            actionText: appLocalizations.confirm,
            onPressed: onPressed,
            cancelText: appLocalizations.dismiss,
            onCancelPressed: () => Navigator.pop(context),
          ),
        ),
  );
}
