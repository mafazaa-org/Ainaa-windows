import 'package:ainaa/constants/dialog_overlay.dart';
import 'package:ainaa/core/shared_widgets/app_confirm_popup.dart';
import 'package:ainaa/core/types/localized_string.dart';
import 'package:ainaa/core/utils/open_link.dart';
import 'package:ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class ForceUpdateAppLayout extends StatelessWidget {
  final String updateUrl;
  final LocalizedString? reasonMessage;
  const ForceUpdateAppLayout(this.updateUrl, this.reasonMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Dialog(
      child: AppDialogLayout(
        text: appLocalizations.must_update_app,
        subText:
            reasonMessage?.get() ??
            appLocalizations.must_update_app_to_continue_usage,
        actionText: appLocalizations.update,
        onPressed: () {
          try {
            openLink(updateUrl);
          } catch (e) {
            DialogOverlay.show(
              context,
              child: AppDialogLayout(
                text: appLocalizations.something_went_wrong,
                actionText: appLocalizations.ok,
                onPressed: DialogOverlay.hide,
              ),
            );
          }
        },
      ),
    );
  }
}
