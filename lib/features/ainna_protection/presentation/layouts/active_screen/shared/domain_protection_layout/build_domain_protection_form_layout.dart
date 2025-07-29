part of 'build_specific_domain_protection_layout.dart';

class _BuildDomainProtectionFormLayout extends StatelessWidget {
  final FormFieldState<String> field;
  const _BuildDomainProtectionFormLayout({required this.field});
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final controller = TextEditingController(text: field.value);
    return AppTextField(
      controller: controller,
      label: appLocalizations.please_enter_needed_specific_app_activation_url,
      textStyle: context.textStyles.bodyLarge,
      hintText: appLocalizations.url_example,
      errorText: field.errorText,
      keyboardType: TextInputType.url,
      onChanged: (value) {
        //redundant: field.didChange(value);
        //needs to use controller to listen to outsiders changes
      },
    );
  }
}
