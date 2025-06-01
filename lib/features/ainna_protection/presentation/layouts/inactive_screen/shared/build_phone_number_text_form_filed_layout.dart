import 'package:blocker_windows/core/shared_widgets/app_text_field.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class BuildPhoneNumberTextFormFiledLayout extends StatelessWidget {
  const BuildPhoneNumberTextFormFiledLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;
    return AppTextField(
      hintText: appLocalization.please_enter_phone_number,
      // initialValue: ,
      keyboardType: TextInputType.phone,
      onChanged: (value) {},
      // onFieldSubmitted: (value) {
      //   debugPrint('updating $value');
      //   chosenProtectionProvider.updateChosenOption(value);
      // },
      autofillHints: [AutofillHints.telephoneNumber],
      label: '',
      // validator:
      //     (value) =>
      //         TextFormValidations.number(appLocalization, value),
      // autovalidateMode: AutovalidateMode.onUnfocus,
    );
  }
}
