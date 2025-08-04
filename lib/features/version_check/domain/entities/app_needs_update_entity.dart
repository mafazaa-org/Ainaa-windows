// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:ainaa/core/types/localized_string.dart';

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
  final String? protectBatchUrl;
  final String? domainsTxtUrl;
  final String? youtubeTxtUrl;
  const AinnaNeedsUpdate({
    required this.protectBatchUrl,
    required this.domainsTxtUrl,
    required this.youtubeTxtUrl,
    required super.isNecessaryUpdate,
    required super.reasonMessage,
  }) : assert(
         protectBatchUrl != null || domainsTxtUrl != null,
         youtubeTxtUrl != null,
       );
  @override
  List<Object?> get props => [
    super.props,
    protectBatchUrl,
    domainsTxtUrl,
    youtubeTxtUrl,
  ];

  @override
  String toString() =>
      'AinnaNeedsUpdate(protectBatchUrl: $protectBatchUrl, domainsTxtUrl: $domainsTxtUrl, youtubeTxtUrl: $youtubeTxtUrl)';
}
