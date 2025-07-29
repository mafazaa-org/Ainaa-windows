import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/constants/confirm_overlay.dart';
import 'package:Ainaa/constants/loading_overlay.dart';
import 'package:Ainaa/features/ainna_protection/presentation/ainaa_domain_protection_cubit/ainaa_domain_protection_cubit.dart';
import 'package:Ainaa/features/ainna_protection/presentation/layouts/active_screen/large/active_ainna_protection_large_screen.dart';
import 'package:Ainaa/features/ainna_protection/presentation/layouts/ainna_protection_error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveAinnaProtectionHeadLayout extends StatelessWidget {
  const ActiveAinnaProtectionHeadLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AinaaDomainProtectionCubit, AinaaDomainProtectionState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ConfirmOverlay.show(
            context,
            AinnaProtectionErrorLayout(
              state.errorMessage!,
              context.read<AinaaDomainProtectionCubit>().restErrorMsg,
            ),
          );
        } else if (state.isProcessing) {
          LoadingOverlay.show(context);
        } else {
          LoadingOverlay.hide(context);
          ConfirmOverlay.hide(context);
        }
      },

      child:
          context.isTabletOrDesktop
              ? ActiveAinnaProtectionLargeLayout()
              : SizedBox.shrink(),
    );
  }
}
