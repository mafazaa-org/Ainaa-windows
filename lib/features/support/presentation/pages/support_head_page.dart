import 'package:ainaa/config/extensions/context_extension.dart';
import 'package:ainaa/constants/dialog_overlay.dart';
import 'package:ainaa/core/shared_widgets/app_confirm_popup.dart';
import 'package:ainaa/core/utils/app_error_wrapper.dart';
import 'package:ainaa/features/support/presentation/cubit/support_us_cubit.dart';
import 'package:ainaa/features/support/presentation/layouts/large/support_large_page.dart';
import 'package:ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupportHeadPage extends StatelessWidget {
  const SupportHeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return BlocListener<SupportUsCubit, SupportUsState>(
      listener:
          (context, state) => switch (state) {
            SupportUsFailed(code: final code) => DialogOverlay.show(
              context,
              child: AppDialogLayout(
                text: AppErrorWrapper.map(code, appLocalizations),
                actionText: appLocalizations.ok,
                onPressed: () {
                  context.read<SupportUsCubit>().rest();
                  DialogOverlay.hide();
                },
              ),
            ),
            _ => (),
          },
      child: Scaffold(
        body:
            context.isTabletOrDesktop ? SupportLargePage() : SizedBox.shrink(),
      ),
    );
  }
}
