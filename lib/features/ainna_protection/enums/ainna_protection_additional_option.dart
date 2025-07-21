typedef AinnaProtectionAdditionalOptions = Set<AinnaProtectionAdditionalOption>;

enum AinnaProtectionAdditionalOption { youtube }

extension AinnaProtectionAdditionalOptionJson
    on AinnaProtectionAdditionalOption {
  String toJson() => name;

  static AinnaProtectionAdditionalOption fromJson(String json) =>
      AinnaProtectionAdditionalOption.values.firstWhere((e) => e.name == json);
}

extension AinnaProtectionAdditionalOptionsJson
    on AinnaProtectionAdditionalOptions {
  List<String> toJson() => map((e) => e.toJson()).toList();

  static AinnaProtectionAdditionalOptions fromJson(List<String> options) =>
      options
          .map((option) => AinnaProtectionAdditionalOptionJson.fromJson(option))
          .toSet();
}
