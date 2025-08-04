import 'package:ainaa/constants/dialog_overlay.dart';
import 'package:ainaa/constants/loading_overlay.dart';
import 'package:ainaa/features/app_meta_data/domain/entities/app_meta_data_entity.dart';
import 'package:ainaa/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/active_screen/active_ainna_protection_head_layout.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/inactive_screen/inactive_ainna_protection_head_layout.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/inactive_screen/inactive_ainna_protection_head_skelton.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/shared/app_bar/app_bar_head.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/ainna_protection_error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AinnaProtectionPage extends StatelessWidget {
  final AppMetaData appMetaData;

  const AinnaProtectionPage(this.appMetaData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHead(context),
      body: Center(
        child: BlocConsumer<AinaaProtectionCubit, AinaaProtectionState>(
          listener:
              (context, state) => switch (state) {
                AinaaProtectionState(
                  isLoading: final isLoading,
                  errorMessage: final errorMessage,
                ) =>
                  {
                    if (errorMessage != null)
                      {
                        DialogOverlay.show(
                          context,
                          child: AinnaProtectionErrorLayout(
                            errorMessage,
                            context.read<AinaaProtectionCubit>().restErrorMsg,
                          ),
                        ),
                      }
                    else if (isLoading)
                      {LoadingOverlay.show(context)}
                    else
                      {DialogOverlay.hide(), LoadingOverlay.hide()},
                  },
              },
          builder:
              (context, state) => switch (state) {
                AinaaProtectionInactive() => InactiveAinnaProtectionHeadSkelton(
                  appMetaData,
                  child: InactiveAinnaProtectionHeadLayout(),
                ),
                AinaaProtectionActive() => ActiveAinnaProtectionHeadLayout(),
              },
        ),
      ),
    );
  }
}
