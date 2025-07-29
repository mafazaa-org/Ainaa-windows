// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:Ainaa/core/types/localized_string.dart';

abstract class AppNeedsUpdate extends Equatable {
  final bool isNecessaryUpdate;
  final LocalizedString? reasonMessage;

  const AppNeedsUpdate({
    required this.isNecessaryUpdate,
    required this.reasonMessage,
  });

  @override
  List<Object?> get props => [isNecessaryUpdate, reasonMessage];

  @override
  bool get stringify => true;
}

class AppNeedsVersionUpdate extends AppNeedsUpdate {
  final String updateUrl;
  const AppNeedsVersionUpdate({
    required this.updateUrl,
    required super.isNecessaryUpdate,
    required super.reasonMessage,
  });
  @override
  List<Object?> get props => [super.props, updateUrl];

  @override
  String toString() => 'AppNeedsVersionUpdate(updateUrl: $updateUrl)';
}

class AinnaNeedsUpdate extends AppNeedsUpdate {
  final String? lowProtectBatchUrl;
  final String? highProtectBatchUrl;
  const AinnaNeedsUpdate({
    required this.lowProtectBatchUrl,
    required this.highProtectBatchUrl,
    required super.isNecessaryUpdate,
    required super.reasonMessage,
  }) : assert(lowProtectBatchUrl != null || highProtectBatchUrl != null);
  @override
  List<Object?> get props => [
    super.props,
    lowProtectBatchUrl,
    highProtectBatchUrl,
  ];

  @override
  String toString() =>
      'AinnaNeedsUpdate(lowProtectBatchUrl: $lowProtectBatchUrl, highProtectBatchUrl: $highProtectBatchUrl)';
}
