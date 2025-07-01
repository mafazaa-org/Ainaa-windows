import 'package:blocker_windows/config/dependency_injection/dependency_injection.dart';
import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/core/shared_widgets/ainna_icon.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/cubit/ainaa_protection_cubit.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/shared/confirm_ainna_protection.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildAinnaProtectionButton extends StatelessWidget {
  // final GlobalKey<FormState> formKey;
  final bool isFieldValid;
  const BuildAinnaProtectionButton(this.isFieldValid, {super.key});
  @override
  Widget build(BuildContext context) {
    final chosenProtectionProvider = context.watch<ChosenProtectionProvider>();
    final chosenOption = chosenProtectionProvider.chosenOption;
    final phoneNumber = chosenProtectionProvider.phoneNumber;
    return SizedBox(
      height: 72.spMin,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed:
            isFieldValid && chosenOption != null && phoneNumber != null
                ? () {
                  confirmAinnaProtection(
                    context,
                    onConfirm: () {
                      getIt<AinaaProtectionCubit>().activate(
                        chosenOption,
                        phoneNumber,
                      );
                    },
                  );
                }
                : null,
        child: _BuildLayoutContent(),
      ),
    );
  }
}

class _BuildLayoutContent extends StatelessWidget {
  const _BuildLayoutContent();
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Row(
      spacing: AppSpacing.sm,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AinnaIcon(),
        Text(
          appLocalizations.activate_protection,
          style: context.textStyles.textActionPrimary,
        ),
      ],
    );
  }
}
