import 'package:ainaa/features/ainna_protection/presentation/layouts/inactive_screen/inactive_ainna_protection_head_skelton.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart';
import 'package:ainaa/features/ainna_protection/presentation/layouts/inactive_screen/shared/build_protection_option_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildProtectionOptionsLayout extends StatelessWidget {
  final double choiceChipWidth;
  const BuildProtectionOptionsLayout(this.choiceChipWidth, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChosenProtectionProvider>();
    final options =
        InactiveAinnaProtectionHeadSkelton.of(
          context,
        )!.appMetaData.ainnaProtectionLevels;

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        // spacing: AppSpacing.minHorizontal,
        alignment: WrapAlignment.spaceBetween,
        // runSpacing: AppSpacing.minHorizontal,
        children:
            options.map((option) {
              return BuildProtectionOptionLayout(
                chosenProtectionProvider: provider,
                option: option,
                width: choiceChipWidth,
              );
            }).toList(),
      ),
    );
  }
}
