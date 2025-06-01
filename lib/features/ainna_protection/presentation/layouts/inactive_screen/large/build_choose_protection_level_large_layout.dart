part of 'inactive_ainna_protection_large_layout.dart';

class _BuildChooseProtectionLevelLargeLayout extends StatelessWidget {
  // const _BuildChooseProtectionLevelLargeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = constraints.maxWidth / 2 - AppSpacing.sm;
        return BuildProtectionOptionsLayout(itemWidth);
      },
    );
  }
}
