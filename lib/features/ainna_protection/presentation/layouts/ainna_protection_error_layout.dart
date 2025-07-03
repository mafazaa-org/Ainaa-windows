import 'package:blocker_windows/core/shared_widgets/app_confirm_popup.dart';
import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: AppConfirmLayout(
        text: errorMessage.get(),
        actionText: appLocalizations.ok,
        onPressed: onPressed,
      ),
    );
  }
}
