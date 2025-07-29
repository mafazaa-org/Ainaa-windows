import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/constants/app_constants.dart';
import 'package:Ainaa/constants/app_spacing.dart';
import 'package:Ainaa/constants/app_styles.dart';
import 'package:Ainaa/core/utils/text_form_validations.dart';
import 'package:Ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AppPhoneNumberTextField extends StatelessWidget {
  final String label;
  final TextStyle? textStyle;
  final void Function(PhoneNumber) onInputChanged;
  // final void Function(bool) onInputValidated;
  const AppPhoneNumberTextField({
    super.key,
    required this.label,
    this.textStyle,
    required this.onInputChanged,
    // required this.onInputValidated,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      spacing: AppSpacing.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textStyle ?? context.textStyles.bodyLarge),
        Localizations(
          locale: Locale('en'),
          delegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          child: InternationalPhoneNumberInput(
            onInputChanged: onInputChanged,
            hintText: null,
            errorMessage: null,
            // onInputValidated:onInputValidated,
            countries: AppConstants.countriesAlpha2Codes,
            initialValue: PhoneNumber(isoCode: 'EG'),
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
              setSelectorButtonAsPrefixIcon: true,
              // countryComparator: (p0, p1) => p0.alpha2Code == 'EG' ? 1 : 0,
            ),
            // ignoreBlank: true,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator:
                (value) =>
                    TextFormValidations.phoneNumber(appLocalizations, value),
            // initialValue: number,
            // textFieldController: controller,
            formatInput: true,
            keyboardType: TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
            textStyle: context.textStyles.bodyMedium,
            selectorTextStyle: context.textStyles.displaySmall,
            inputBorder: AppStyles.outlineInputBorderXS(
              color: context.theme.dividerColor,
              gapPadding: 8.0,
            ),
            selectorButtonOnErrorPadding: 44,
            searchBoxDecoration: InputDecoration(),
          ),
        ),
      ],
    );
  }
}
