import 'package:blocker_windows/constants/app_constants.dart';
import 'package:blocker_windows/features/version_check/domain/entities/app_needs_update_entity.dart';
import 'package:blocker_windows/features/version_check/domain/entities/app_required_version_entity.dart';
import 'package:blocker_windows/features/version_check/data/models/app_needs_update_model.dart';

class AppRequiredVersionModel {
  final String latestVersion;
  final bool isSameVersion;
  final AppNeedsUpdateModel? appNeedsUpdate;

  const AppRequiredVersionModel({
    required this.latestVersion,
    this.appNeedsUpdate,
  }) : isSameVersion = appNeedsUpdate != null ? false : true;

  AppRequiredVersion toEntity() {
    AppNeedsUpdate? convertedUpdate;

    if (appNeedsUpdate != null) {
      switch (appNeedsUpdate) {
        case AppNeedsVersionUpdateModel versionUpdate:
          convertedUpdate = versionUpdate.toEntity();
          break;
        case AinnaNeedsUpdateModel ainnaUpdate:
          convertedUpdate = ainnaUpdate.toEntity();
          break;
        default:
          convertedUpdate = null;
      }
    }

    return AppRequiredVersion(
      latestVersion: latestVersion,
      isSameVersion: isSameVersion,
      appNeedsUpdate: convertedUpdate,
    );
  }

  factory AppRequiredVersionModel.defaultModel(String latestVersion) {
    return AppRequiredVersionModel(latestVersion: latestVersion);
  }

  factory AppRequiredVersionModel.fromJson(Map<String, dynamic> json) {
    final version = json['version'];
    final currentVersion = AppConstants.appVersion;
    if (version == null) {
      return AppRequiredVersionModel.asMatchedFromJson(currentVersion);
    } else if (json.containsKey('updateUrl')) {
      return AppRequiredVersionModel.asVersionUpdateFromJson(json);
    } else if ((json.containsKey('lowProtectBatchUrl') ||
        json.containsKey('highProtectBatchUrl'))) {
      return AppRequiredVersionModel.asAinnaNeedsUpdateFromJson(json);
    }
    return AppRequiredVersionModel.asMatchedFromJson(currentVersion);
  }

  factory AppRequiredVersionModel.asMatchedFromJson(String version) =>
      AppRequiredVersionModel(latestVersion: version);

  factory AppRequiredVersionModel.asVersionUpdateFromJson(
    Map<String, dynamic> json,
  ) => AppRequiredVersionModel(
    latestVersion: json['version'],
    appNeedsUpdate: AppNeedsVersionUpdateModel.fromJson(json),
  );

  factory AppRequiredVersionModel.asAinnaNeedsUpdateFromJson(
    Map<String, dynamic> json,
  ) => AppRequiredVersionModel(
    latestVersion: json['version'],
    appNeedsUpdate: AinnaNeedsUpdateModel.fromJson(json),
  );
}
