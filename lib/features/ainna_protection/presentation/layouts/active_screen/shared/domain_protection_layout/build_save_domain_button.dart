part of 'build_specific_domain_protection_layout.dart';

class _BuildSaveDomainButton extends StatelessWidget {
  final bool isValid;
  const _BuildSaveDomainButton({required this.isValid});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top: AppSpacing.sl),
      child: AppElevatedButton(
        onPressed:
            isValid
                ? () {
                  //TODO: action to add the url to the protection list
                }
                : null,
        text: appLocalizations.save,
      ),
    );
  }
}
