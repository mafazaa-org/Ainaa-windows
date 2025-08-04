import 'package:ainaa/core/types/localized_string.dart';
import 'package:ainaa/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:equatable/equatable.dart';

typedef AinnaProtectionLevels = List<AinnaProtectionLevel>;

class AinnaProtectionLevel extends Equatable {
  final AinnaActivationType activationType;
  final String optionBatchPath;
  final LocalizedString name;
  final LocalizedString description;
  final List<LocalizedString> tags;
  final bool isAvailable;

  const AinnaProtectionLevel({
    required this.activationType,
    required this.optionBatchPath,
    required this.name,
    required this.description,
    required this.tags,
    required this.isAvailable,
  });

  @override
  List<Object?> get props => [activationType, name, optionBatchPath];
}
