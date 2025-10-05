import 'package:ainaa/config/dependency_injection/dependency_injection.dart';
import 'package:ainaa/config/extensions/context_extension.dart';
import 'package:ainaa/constants/app_spacing.dart';
import 'package:ainaa/core/shared_widgets/ainna_icon.dart';
import 'package:ainaa/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/inactive_screen/shared/confirm_activate_ainna_protection.dart';
import 'package:ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildAinnaProtectionButton extends StatelessWidget {
  // final GlobalKey<FormState> formKey;
  // final bool isFieldValid;
  final double width;
  const BuildAinnaProtectionButton({super.key, required this.width});
  @override
  Widget build(BuildContext context) {
    final chosenProtectionProvider = context.watch<ChosenProtectionProvider>();
    final activationType = chosenProtectionProvider.chosenOption;
    final optionBatchPath = chosenProtectionProvider.optionBatchPath;
    // final isValidNumber = chosenProtectionProvider.validPhoneNumber;
    // final phoneNumber = chosenProtectionProvider.phoneNumber;
    return Container(
      height: 72.spMin,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal:
            context.isMobile
                ? AppSpacing.sm
                : context.isTablet
                ? width * .15
                : width * .25,
      ),
      child: ElevatedButton(
        onPressed:
            // isValidNumber &&
            //         phoneNumber != null &&
            activationType != null && optionBatchPath != null
                ? () {
                  confirmActivateAinnaProtection(
                    context,
                    onConfirm: () {
                      getIt<AinaaProtectionCubit>().activate(
                        activationType,
                        optionBatchPath,
                        // phoneNumber,
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
