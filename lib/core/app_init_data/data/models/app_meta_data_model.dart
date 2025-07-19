import 'package:blocker_windows/core/app_init_data/data/models/ainna_protection_level_model.dart';
import 'package:blocker_windows/core/app_init_data/domain/entities/app_meta_data_entity.dart';

class AppMetaDataModel {
  final AinnaProtectionLevelModels ainnaProtectionLevelModels;
  const AppMetaDataModel(this.ainnaProtectionLevelModels);

  AppMetaData toEntity() => AppMetaData(ainnaProtectionLevelModels.toEntity());
}
