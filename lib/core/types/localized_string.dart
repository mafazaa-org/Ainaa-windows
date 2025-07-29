// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/rendering.dart';

import 'package:Ainaa/l10n/generated/app_localizations.dart';

/// A utility class for managing localized strings
///
/// {@tool snippet}
///
/// Factory constructor for Arabic-only strings
///
/// ```dart
/// final greeting = LocalizedString.fromArString('مرحبا');
/// print(greeting.get());  // 'مرحبا'
///
/// ```
///
/// {@end-tool}

class LocalizedString {
  static const _locales = AppLocalizations.supportedLocales;
  final Map<Locale, String> _map;

  const LocalizedString._(this._map);

  String get([Locale? langLocal]) =>
      _map[langLocal] ?? _map[Locale('ar')] ?? '';

  // currently expecting arabic 'ar'
  factory LocalizedString.fromArString(String? arString) =>
      LocalizedString._({Locale('ar'): arString ?? ''});

  // if localization implemented
  factory LocalizedString.fromJson(Map<String, String> json) {
    final languageCode =
        _locales.map((element) => element.languageCode).toList();
    final map = <Locale, String>{};
    json.forEach((key, value) {
      if (languageCode.contains(key)) {
        map[Locale(key)] = value;
      }
    });
    return LocalizedString._(map);
  }
}
