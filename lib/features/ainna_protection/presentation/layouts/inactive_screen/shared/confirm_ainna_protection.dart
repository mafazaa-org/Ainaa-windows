import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:blocker_windows/constants/app_confirm_popup.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

void confirmAinnaProtection(
  BuildContext context, {
  required void Function()? onConfirm,
}) {
  final appLocalizations = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    builder:
        (context) => Dialog(
          child: AppConfirmPopup(
            text: appLocalizations.want_to_activate_protection,
            subText: appLocalizations.want_to_activate_protection_desc,
            actionText: appLocalizations.confirm_activate_protection,
            onPressed: () {
              Navigator.canPop(context);
              onConfirm.call();
            },
            cancelText: appLocalizations.later,
            onCancelTap: () => Navigator.maybePop(context),
          ),
        ),
  );
}
