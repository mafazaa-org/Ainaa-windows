import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/features/app_meta_data/domain/entities/ainna_protection_level_entity.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/shared/card_layout/build_card_layout.dart';
import 'package:flutter/material.dart';

class BuildProtectionOptionLayout extends StatelessWidget {
  final AinnaProtectionLevel option;
  final ChosenProtectionProvider chosenProtectionProvider;
  final double width;

  const BuildProtectionOptionLayout({
    required this.chosenProtectionProvider,
    required this.option,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected =
        chosenProtectionProvider.chosenOption == option.activationType;
    // debugPrint('layout: ${chosenProtectionProvider.chosenOption}');
    return SizedBox(
      width: width,
      // height: 200,
      child: ChoiceChip(
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.all(AppSpacing.md),
        // shape: choiceShape(isSelected, theme),
        label: BuildCardLayout(
          width: width,
          isSelected: isSelected,
          option: option,
        ),
        selected: isSelected,

        onSelected:
            (_) =>
                isSelected
                    ? null
                    : chosenProtectionProvider.updateChosenOption(option),
      ),
    );
  }
}
