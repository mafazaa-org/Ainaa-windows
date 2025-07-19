// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:blocker_windows/core/app_init_data/domain/entities/app_needs_update_entity.dart';

class AppRequiredVersion extends Equatable {
  final String latestVersion;
  final bool isSameVersion;
  final AppNeedsUpdate? appNeedsUpdate;

  const AppRequiredVersion({
    required this.latestVersion,
    required this.isSameVersion,
    required this.appNeedsUpdate,
  });

  @override
  List<Object?> get props => [latestVersion, isSameVersion, appNeedsUpdate];

  @override
  bool get stringify => true;
}
