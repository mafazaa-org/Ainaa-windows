import 'package:ainaa/config/extensions/context_extension.dart';
import 'package:ainaa/constants/app_icons.dart';
import 'package:ainaa/constants/app_spacing.dart';
import 'package:ainaa/core/shared_widgets/app_text_button.dart';
import 'package:ainaa/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/active_screen/reactivate_layout/shared/confirm_reactivate_ainna_protection.dart';
import 'package:ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'large/reactive_ainna_protection_large_layout.dart';

class ReactiveAinnaProtectionLayout extends StatelessWidget {
  const ReactiveAinnaProtectionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final ainnaActiveState = context.read<AinaaProtectionCubit>().state;

    if (ainnaActiveState case AinaaProtectionActive active) {
      return context.isTabletOrDesktop
          ? ReactiveAinnaProtectionLargeLayout(active)
          : SizedBox.shrink();
    }
    return SizedBox.shrink();
  }
}
