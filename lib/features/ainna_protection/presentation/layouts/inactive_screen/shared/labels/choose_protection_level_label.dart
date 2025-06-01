part of 'labels_layouts.dart';

class ChooseProtectionLevelLabel extends StatelessWidget {
  const ChooseProtectionLevelLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Text(
      appLocalizations.choose_protection_level,
      style: context.textStyles.headingMedium,
    );
  }
}
