import 'package:blocker_windows/core/types/localized_string.dart';

enum AinnaActivationType {
  high('العالية'),
  low('المنخفضة');

  final String arLabel;
  const AinnaActivationType(this.arLabel);

  LocalizedString get label => LocalizedString.fromArString(arLabel);

  bool get isHigh => this == high;
  bool get isLow => this == high;
}

extension AinnaActivationTypeJson on AinnaActivationType {
  String toJson() => name;

  static AinnaActivationType fromJson(String json) =>
      AinnaActivationType.values.firstWhere((e) => e.name == json);
}
