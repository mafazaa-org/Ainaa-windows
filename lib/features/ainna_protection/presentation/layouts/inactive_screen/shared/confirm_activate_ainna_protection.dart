import 'package:ainaa/config/extensions/context_extension.dart';
import 'package:ainaa/constants/app_spacing.dart';
import 'package:ainaa/core/shared_widgets/app_confirm_popup.dart';
import 'package:ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

void confirmActivateAinnaProtection(
  BuildContext context, {
  required void Function() onConfirm,
}) {
  final appLocalizations = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => Dialog(
          child: AppDialogLayout(
            title: _BuildConfirmActivateAinnaProtectionTitle(),
            // text: appLocalizations.want_to_activate_protection,
            // subText: appLocalizations.want_to_activate_protection_desc,
            actionText: appLocalizations.confirm_activate_protection,
            onPressed: () {
              Navigator.maybePop(context);
              onConfirm.call();
            },
            cancelText: appLocalizations.dismiss,
            onCancelPressed: () => Navigator.maybePop(context),
          ),
        ),
  );
}

class _BuildConfirmActivateAinnaProtectionTitle extends StatelessWidget {
  const _BuildConfirmActivateAinnaProtectionTitle();
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Column(
        spacing: AppSpacing.sm,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            textAlign: TextAlign.justify,
            TextSpan(
              text: '${appLocalizations.alert_before_activating}\n',
              style: context.textStyles.displaySmallMedium,
              children: [
                TextSpan(
                  text: appLocalizations.read_desc_carefully,
                  style: context.textStyles.bodyMedium,
                ),
              ],
            ),
          ),
          Text.rich(
            textAlign: TextAlign.justify,
            TextSpan(
              text: '${appLocalizations.want_to_activate_protection_desc}\n',
              style: context.textStyles.bodyMedium,
              children: [
                TextSpan(
                  text: appLocalizations.want_to_activate_protection,
                  style: context.textStyles.displaySmallMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
