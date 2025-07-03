part of 'build_specific_domain_protection_layout.dart';

class _BuildProtectDomainButton extends StatelessWidget {
  final String? value;
  final bool isValid;
  const _BuildProtectDomainButton({required this.value, required this.isValid});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top: AppSpacing.sl),
      child: AppElevatedButton(
        text: appLocalizations.save,
        onPressed:
            (isValid && value != null)
                ? () {
                  context.read<AinaaDomainProtectionCubit>().domainProtection(
                    value!,
                  );
                }
                : null,
      ),
    );
  }
}
