import 'package:ainaa/core/utils/text_form_validations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_mock_localization.dart';

void main() {
  final l10n = AppMockLocalizationAr();
  group('Phone Number Validation', () {
    test('Returns error for empty input', () {
      expect(
        TextFormValidations.phoneNumber(l10n, null),
        l10n.require_phone_number,
      );
      expect(
        TextFormValidations.phoneNumber(l10n, ''),
        l10n.require_phone_number,
      );
    });

    test('Rejects invalid phone formats', () {
      expect(
        TextFormValidations.phoneNumber(l10n, 'abc'),
        l10n.require_valid_phone_number,
      );
      expect(
        TextFormValidations.phoneNumber(l10n, '123'),
        l10n.require_valid_phone_number,
      ); // Too short
    });

    test('Accepts valid phone numbers', () {
      expect(TextFormValidations.phoneNumber(l10n, '+1234567890'), isNull);
      expect(
        TextFormValidations.phoneNumber(l10n, '12345678'),
        isNull,
      ); // 8+ digits
    });
  });

  group('URL Validation', () {
    test('Adds https:// prefix if missing', () {
      expect(
        TextFormValidations.url(l10n, 'example.com'),
        isNull,
      ); // Implicit https
    });

    test('Rejects invalid URLs', () {
      expect(TextFormValidations.url(l10n, 'http://'), l10n.invalid_url);
      expect(TextFormValidations.url(l10n, 'ftp://test.com'), l10n.invalid_url);
      expect(
        TextFormValidations.url(l10n, 'http://localhost:8080'),
        l10n.invalid_url,
      );
    });

    test('Accepts valid URLs', () {
      expect(TextFormValidations.url(l10n, 'flutter.dev'), isNull);
      expect(TextFormValidations.url(l10n, 'localhost:3000'), l10n.invalid_url);
    });
  });

  group('Name Validation', () {
    test('Rejects names outside 2-24 chars', () {
      expect(TextFormValidations.name(l10n, 'A'), ''); // Too short
      expect(TextFormValidations.name(l10n, 'A' * 25), ''); // Too long
    });

    test('Accepts valid names', () {
      expect(TextFormValidations.name(l10n, 'John Doe'), isNull);
    });
  });

  group('Email Validation', () {
    test('Rejects empty emails', () {
      expect(TextFormValidations.emailAddress(l10n, null), '');
    });

    // Add more email regex tests if needed
  });

  group('Paragraph Validation', () {
    test('Rejects empty paragraphs', () {
      expect(TextFormValidations.paragraph(l10n, null), '');
    });

    test('Accepts any paragraphs', () {
      expect(TextFormValidations.paragraph(l10n, 'dsnfkh dksbfk'), isNull);
    });
  });
}
