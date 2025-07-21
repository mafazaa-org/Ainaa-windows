enum AinnaActivationType { high, low }

extension AinnaActivationTypeJson on AinnaActivationType {
  String toJson() => name;

  static AinnaActivationType fromJson(String json) =>
      AinnaActivationType.values.firstWhere((e) => e.name == json);
}
