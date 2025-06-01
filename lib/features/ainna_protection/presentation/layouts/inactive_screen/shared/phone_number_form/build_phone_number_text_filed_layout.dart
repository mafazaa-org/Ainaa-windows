part of 'build_phone_number_form_layout.dart';

class BuildPhoneNumberTextFiledLayout extends StatelessWidget {
  final FormFieldState<String> field;
  const BuildPhoneNumberTextFiledLayout(this.field, {super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final chosenProtectionProvider = context.read<ChosenProtectionProvider>();
    return AppTextField(
      label: appLocalizations.phone_number,
      hintText: appLocalizations.please_enter_phone_number,
      errorText: field.errorText,
      // initialValue: ,
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        field.didChange(value);
        if (field.isValid) {
          chosenProtectionProvider.updatePhoneNumber(value);
        }
      },
      autofillHints: [AutofillHints.telephoneNumber],
    );
  }
}
