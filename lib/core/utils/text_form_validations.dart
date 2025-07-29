import 'package:Ainaa/l10n/generated/app_localizations.dart';

// TODO: form validation
final class TextFormValidations {
  static String? phoneNumber(AppLocalizations appLocalizations, String? value) {
    // var logger = Logger(printer: PrettyPrinter());
    // logger.d('validating: $value');
    if (value == null || value.isEmpty) {
      return appLocalizations.require_valid_phone_number;
    }
    final regex = RegExp(r'^\+?[0-9]{10,18}$');
    if (!regex.hasMatch(value)) {
      return appLocalizations.require_valid_phone_number;
    }
    return null;
  }

  static bool validPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    final regex = RegExp(r'^\+?[0-9]{10,18}$');
    if (!regex.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String? url(AppLocalizations appLocalizations, String? value) {
    if (value != null) {
      final emailRegex = RegExp(
        r'^(?!\-)([a-zA-Z0-9\-]{1,63}(?<!\-)\.)+[a-zA-Z]{2,}$',
      );
      if (emailRegex.hasMatch(value)) {
        return null;
      }
    }
    return appLocalizations.invalid_url;
  }

  static String? name(AppLocalizations appLocalizations, String? name) {
    if (name == null || name.length < 2 || name.length > 24) {
      return '';
    }
    return null;
  }

  static String? emailAddress(
    AppLocalizations appLocalizations,
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  static String? paragraph(AppLocalizations appLocalizations, String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }
}
