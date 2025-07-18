import 'package:blocker_windows/core/shared_widgets/app_confirm_popup.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

void confirmAinnaProtection(
  BuildContext context, {
  required void Function() onConfirm,
}) {
  final appLocalizations = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => Dialog(
          child: AppConfirmLayout(
            text: appLocalizations.want_to_activate_protection,
            subText: appLocalizations.want_to_activate_protection_desc,
            actionText: appLocalizations.confirm_activate_protection,
            onPressed: () {
              Navigator.maybePop(context);
              onConfirm.call();
            },
            cancelText: appLocalizations.later,
            onCancelTap: () => Navigator.maybePop(context),
          ),
        ),
  );
}
