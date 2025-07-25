import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/features/app_meta_data/domain/entities/ainna_protection_level_entity.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/shared/card_layout/build_card_icon.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/shared/card_layout/build_card_tag_layout.dart';
import 'package:flutter/material.dart';

class BuildCardLayout extends StatelessWidget {
  const BuildCardLayout({
    super.key,
    required this.width,
    required this.isSelected,
    required this.option,
  });

  final double width;
  final bool isSelected;
  final AinnaProtectionLevel option;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          spacing: AppSpacing.sl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildCardIconLayout(isSelected: isSelected),
            Text(option.name.get(), style: context.textStyles.headingSmall),
            // wrapped in SizedBox to allow multi line text
            SizedBox(
              child: Text(
                option.description.get(),
                style: context.textStyles.bodySmall,
                overflow: TextOverflow.visible,
                maxLines: 3,
                softWrap: true,
              ),
            ),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children:
                  option.tags.map((tag) => BuildCardTagLayout(tag)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
