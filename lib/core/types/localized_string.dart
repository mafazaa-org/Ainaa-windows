// general helper class to store localized strings

class LocalizedString {
  final Map<String, String> _map;

  LocalizedString(this._map);

  String get([String? langCode]) => _map[langCode] ?? _map['ar'] ?? '';

  // currently expecting arabic 'ar'
  factory LocalizedString.fromArString(String arString) =>
      LocalizedString({'ar': arString});

  // if localization implemented
  //   factory LocalizedString.fromJson(Map<String, dynamic> json) =>
  //       LocalizedString(Map<String, String>.from(json));
}
