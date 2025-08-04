import 'package:ainaa/core/types/localized_string.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('LocalizedString', () {
    test('should return Arabic string when Locale("ar") is requested', () {
      final loc = LocalizedString.fromArString('مرحبا');
      expect(loc.get(Locale('ar')), equals('مرحبا'));
    });

    test('should fallback to first supported locale if none provided', () {
      final loc = LocalizedString.fromArString('مرحبا');
      expect(loc.get(), equals(loc.get(Locale('ar'))));
    });

    test('should return locale string if its provided', () {
      final loc = LocalizedString.fromJson({'ar': 'مرحبا', 'en': 'Hello'});
      expect(loc.get(Locale('en')), equals('Hello'));
    });

    test(
      'should return arabic string if available when locale is not found',
      () {
        final loc = LocalizedString.fromJson({'ar': 'مرحبا', 'fr': 'Bonjour'});
        expect(loc.get(Locale('en')), equals('مرحبا')); // 'en' not provided
      },
    );

    test(
      'should return empty string if when provided locale and arabic locale is not found',
      () {
        final loc = LocalizedString.fromJson({'ar': 'مرحبا', 'fr': 'Bonjour'});
        expect(loc.get(Locale('en')), equals('مرحبا')); // 'en' not provided
      },
    );

    test('should handle null input gracefully', () {
      final loc = LocalizedString.fromArString(null);
      expect(loc.get(Locale('ar')), equals(''));
    });
  });
}
