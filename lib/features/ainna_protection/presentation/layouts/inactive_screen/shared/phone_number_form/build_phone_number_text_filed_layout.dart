part of 'build_phone_number_form_layout.dart';

class BuildPhoneNumberTextFiledLayout extends StatelessWidget {
  const BuildPhoneNumberTextFiledLayout({super.key});

  @override
  Widget build(BuildContext context) {
    String? phoneNumber;
    String? dialCode;
    final appLocalizations = AppLocalizations.of(context)!;
    return AppPhoneNumberTextField(
      label: appLocalizations.phone_number,
      onInputChanged: (PhoneNumber number) {
        phoneNumber = number.phoneNumber;
        dialCode = number.dialCode;
        if (phoneNumber != null && dialCode != null) {
          phoneNumber = phoneNumber!.substring(dialCode!.length);
          // debugPrint('dialCode: $dialCode');
          // context.read<ChosenProtectionProvider>().updatePhoneNumber(
          //   phoneNumber,
          // );
        }
      },
    );
    // return AppTextField(
    //   label: appLocalizations.phone_number,
    //   hintText: appLocalizations.please_enter_phone_number,
    //   errorText: field.errorText,
    //   // initialValue: ,
    //   keyboardType: TextInputType.phone,
    //   onChanged: (value) {
    //     field.didChange(value);
    //     if (field.isValid) {
    //       chosenProtectionProvider.updatePhoneNumber(value);
    //     }
    //   },
    //   autofillHints: [AutofillHints.telephoneNumber],
    // );
  }
}
