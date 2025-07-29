import 'package:Ainaa/core/app_init_data/domain/entities/app_needs_update_entity.dart';
import 'package:Ainaa/core/types/localized_string.dart';

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
  final String? lowProtectBatchUrl;
  final String? highProtectBatchUrl;
  const AinnaNeedsUpdateModel({
    required this.lowProtectBatchUrl,
    required this.highProtectBatchUrl,
    required super.isNecessaryUpdate,
    required super.reasonMessage,
  });

  factory AinnaNeedsUpdateModel.fromJson(Map<String, dynamic> json) {
    final reasonMessage = json['reasonMessage'];

    return AinnaNeedsUpdateModel(
      lowProtectBatchUrl: json['lowProtectBatchUrl'] as String?,
      highProtectBatchUrl: json['highProtectBatchUrl'] as String?,
      isNecessaryUpdate: json['isNecessaryUpdate'] ?? false,
      reasonMessage:
          (reasonMessage == null || reasonMessage! is Map<String, String>)
              ? null
              : LocalizedString.fromJson(reasonMessage as Map<String, String>),
    );
  }

  AinnaNeedsUpdate toEntity() {
    return AinnaNeedsUpdate(
      lowProtectBatchUrl: lowProtectBatchUrl,
      highProtectBatchUrl: highProtectBatchUrl,
      isNecessaryUpdate: isNecessaryUpdate,
      reasonMessage: reasonMessage,
    );
  }
}
