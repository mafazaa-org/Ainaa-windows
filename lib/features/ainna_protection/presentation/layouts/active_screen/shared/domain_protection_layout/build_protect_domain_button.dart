part of 'build_specific_domain_protection_layout.dart';

class _BuildProtectDomainButton extends StatelessWidget {
  final String? value;
  final bool isValid;
  final FormFieldState<String> field;
  _BuildProtectDomainButton({required this.field})
    : isValid = field.isValid,
      value = field.value;

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
                ? () async {
                  final isSuccess = await context
                      .read<AinaaDomainProtectionCubit>()
                      .domainProtection(value!);
                  if (isSuccess) {
                    field.reset();
                  }
                }
                : null,
      ),
    );
  }
}
