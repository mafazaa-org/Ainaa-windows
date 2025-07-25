import 'package:blocker_windows/features/app_meta_data/domain/entities/entities.dart';
import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_activation_type.dart';

typedef AinnaProtectionLevelModels = List<AinnaProtectionLevelModel>;

class AinnaProtectionLevelModel {
  final AinnaActivationType activationType;
  final String optionBatchPath;
  final String name;
  final String description;
  final List<String> tags;
  final bool isAvailable;

  const AinnaProtectionLevelModel({
    required this.activationType,
    required this.optionBatchPath,
    required this.name,
    required this.description,
    required this.tags,
    required this.isAvailable,
  });

  AinnaProtectionLevel toEntity() => AinnaProtectionLevel(
    activationType: activationType,
    optionBatchPath: optionBatchPath,
    name: LocalizedString.fromArString(name),
    description: LocalizedString.fromArString(description),
    tags: tags.map(LocalizedString.fromArString).toList(),
    isAvailable: isAvailable,
  );
}

extension AinnaProtectionLevelModelEx on AinnaProtectionLevelModels {
  AinnaProtectionLevels toEntity() => map((item) => item.toEntity()).toList();
}
