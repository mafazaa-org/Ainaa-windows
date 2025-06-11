import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/foundation.dart';

// TODO: form validation
final class TextFormValidations {
  static String? phoneNumber(AppLocalizations appLocalizations, String? value) {
    // var logger = Logger(printer: PrettyPrinter());
    // logger.d('validating: $value');
    if (value == null || value.isEmpty) {
      return appLocalizations.require_phone_number;
    }
    final regex = RegExp(r'^\+?[0-9]{8,15}$');
    if (!regex.hasMatch(value)) {
      return appLocalizations.require_valid_phone_number;
    }
    return null;
  }

  static String? url(AppLocalizations appLocalizations, String? value) {
    if (value == null || value.isEmpty) {
      return appLocalizations.invalid_url;
    }

    if (value == 'https://' || value == 'http://') {
      return appLocalizations.invalid_url;
    }

    if (value.contains(':') &&
        (!value.startsWith('http://') && !value.startsWith('https://'))) {
      return appLocalizations.invalid_url;
    }

    if (!value.startsWith('http://') && !value.startsWith('https://')) {
      value = 'https://$value';
    }

    try {
      final uri = Uri.parse(value);

      // Strict validation
      if (uri.isAbsolute &&
          (uri.scheme == 'http' || uri.scheme == 'https') &&
          uri.host.isNotEmpty &&
          !uri.host.contains('localhost') && // Explicitly block localhost
          !uri.host.contains('127.0.0.1') &&
          !uri.host.startsWith('.') &&
          !uri.host.endsWith('.')) {
        return null;
      }
    } catch (_) {}

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
