part of 'build_specific_domain_protection_layout.dart';

class _BuildProtectDomainButton extends StatelessWidget {
  final String? value;
  final bool isValid;
  final FormFieldState<String> field;
  final TextEditingController controller;
  _BuildProtectDomainButton(this.field, this.controller)
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
                ? () => showConfirmDomainProtectionDialog(
                  context,
                  appLocalizations,
                  domains: [value!],
                  onPressed: () async {
                    Navigator.pop(context);
                    final isSuccess = await context
                        .read<AinaaDomainProtectionCubit>()
                        .domainProtection(value!);
                    if (isSuccess) {
                      controller.clear();
                      field.reset();
                    }
                  },
                )
                : null,
      ),
    );
  }
}
