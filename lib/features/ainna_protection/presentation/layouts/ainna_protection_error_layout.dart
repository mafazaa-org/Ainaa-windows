import 'package:blocker_windows/core/shared_widgets/app_confirm_popup.dart';
import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class AinnaProtectionErrorLayout extends StatelessWidget {
  final LocalizedString errorMessage;
  final void Function() onPressed;
  const AinnaProtectionErrorLayout(
    this.errorMessage,
    this.onPressed, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Dialog(
      child: AppDialogLayout(
        // text: errorMessage.get(),
        text: appLocalizations.something_went_wrong,
        actionText: appLocalizations.ok,
        onPressed: onPressed,
      ),
    );
  }
}
