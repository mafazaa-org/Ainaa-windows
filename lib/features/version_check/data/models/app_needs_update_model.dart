import 'package:blocker_windows/features/version_check/domain/entities/app_needs_update_entity.dart';
import 'package:blocker_windows/core/types/localized_string.dart';

abstract class AppNeedsUpdateModel {
  final bool isNecessaryUpdate;
  final LocalizedString? reasonMessage;

  const AppNeedsUpdateModel({
    required this.isNecessaryUpdate,
    this.reasonMessage,
  });
}

class AppNeedsVersionUpdateModel extends AppNeedsUpdateModel {
  final String updateUrl;
  const AppNeedsVersionUpdateModel({
    required this.updateUrl,
    required super.isNecessaryUpdate,
    required super.reasonMessage,
  });

  AppNeedsVersionUpdate toEntity() {
    return AppNeedsVersionUpdate(
      updateUrl: updateUrl,
      isNecessaryUpdate: isNecessaryUpdate,
      reasonMessage: reasonMessage,
    );
  }

  factory AppNeedsVersionUpdateModel.fromJson(Map<String, dynamic> json) {
    final reasonMessage = json['reasonMessage'];
    return AppNeedsVersionUpdateModel(
      updateUrl: json['updateUrl'] as String,
      isNecessaryUpdate: json['isNecessaryUpdate'] ?? false,
      reasonMessage:
          (reasonMessage == null || reasonMessage! is Map<String, String>)
              ? null
              : LocalizedString.fromJson(reasonMessage as Map<String, String>),
    );
  }
}

class AinnaNeedsUpdateModel extends AppNeedsUpdateModel {
  final String? protectBatchUrl;
  final String? domainsTxtUrl;
  final String? youtubeTxtUrl;
  const AinnaNeedsUpdateModel({
    required this.protectBatchUrl,
    required this.domainsTxtUrl,
    required this.youtubeTxtUrl,
    required super.isNecessaryUpdate,
    required super.reasonMessage,
  });

  factory AinnaNeedsUpdateModel.fromJson(Map<String, dynamic> json) {
    final reasonMessage = json['reasonMessage'];

    return AinnaNeedsUpdateModel(
      protectBatchUrl: json['protectBatchUrl'] as String?,
      domainsTxtUrl: json['domainsTxtUrl'] as String?,
      youtubeTxtUrl: json['youtubeTxtUrl'] as String?,
      isNecessaryUpdate: json['isNecessaryUpdate'] ?? false,
      reasonMessage:
          (reasonMessage == null || reasonMessage! is Map<String, String>)
              ? null
              : LocalizedString.fromJson(reasonMessage as Map<String, String>),
    );
  }

  AinnaNeedsUpdate toEntity() {
    return AinnaNeedsUpdate(
      protectBatchUrl: protectBatchUrl,
      domainsTxtUrl: domainsTxtUrl,
      youtubeTxtUrl: youtubeTxtUrl,
      isNecessaryUpdate: isNecessaryUpdate,
      reasonMessage: reasonMessage,
    );
  }
}
