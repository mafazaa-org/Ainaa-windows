import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/core/shared_widgets/app_check_box_tile.dart';
import 'package:blocker_windows/core/shared_widgets/app_confirm_popup.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_protection_additional_option.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_confirm_reactivate_ainna_protection_layout.dart';
part 'build_check_high_protection_layout.dart';
part 'build_check_youtube_protection_layout.dart';

void confirmReactivateAinnaProtection(
  BuildContext context, {
  required AinaaProtectionActive activeState,
}) {
  final appLocalizations = AppLocalizations.of(context)!;
  final ValueNotifier<bool> isHighProtection = ValueNotifier(
    activeState.activationType.isHigh,
  );
  final ValueNotifier<bool> haveYoutubeProtection = ValueNotifier(
    activeState.options.contains(AinnaProtectionAdditionalOption.youtube),
  );
  showDialog(
    context: context,
    builder:
        (context) => Dialog(
          child: AppDialogLayout(
            text: appLocalizations.want_to_reactivate_protection,
            actionText: appLocalizations.confirm_reactivate_protection,
            body: _BuildBody(
              activeState: activeState,
              isHighProtection: isHighProtection,
              appLocalizations: appLocalizations,
              haveYoutubeProtection: haveYoutubeProtection,
            ),
            onPressed: () {
              Navigator.maybePop(context);
              context.read<AinaaProtectionCubit>().reactivate(
                isHighProtection.value
                    ? AinnaActivationType.high
                    : AinnaActivationType.low,
                haveYoutubeProtection.value,
              );
            },
            cancelText: appLocalizations.dismiss,
            onCancelPressed: () => Navigator.maybePop(context),
          ),
        ),
  );
}
