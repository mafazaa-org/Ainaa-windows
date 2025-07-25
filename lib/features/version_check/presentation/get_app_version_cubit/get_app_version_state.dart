part of 'get_app_version_cubit.dart';

sealed class AppRequiredVersionState extends Equatable {
  const AppRequiredVersionState();

  @override
  List<Object?> get props => [];
}

final class Initial extends AppRequiredVersionState {}

final class Loading extends AppRequiredVersionState {}

final class Matched extends AppRequiredVersionState {}

final class Unmatched extends AppRequiredVersionState {
  final String latestVersion;
  final String updateUrl;
  final bool isNecessaryUpdate;
  final LocalizedString? reasonMessage;

  const Unmatched(
    this.latestVersion,
    this.updateUrl,
    this.isNecessaryUpdate,
    this.reasonMessage,
  );

  @override
  List<Object?> get props => [latestVersion, isNecessaryUpdate, reasonMessage];
}

final class AinnaFilesUnmatched extends AppRequiredVersionState {
  final String latestVersion;
  final String? domainsTxtUrl;
  final String? protectBatchUrl;
  final bool isNecessaryUpdate;
  final LocalizedString? reasonMessage;

  const AinnaFilesUnmatched(
    this.latestVersion,
    this.domainsTxtUrl,
    this.protectBatchUrl,
    this.isNecessaryUpdate,
    this.reasonMessage,
  ) : assert(domainsTxtUrl != null || protectBatchUrl != null);

  @override
  List<Object?> get props => [
    latestVersion,
    domainsTxtUrl,
    protectBatchUrl,
    isNecessaryUpdate,
    reasonMessage,
  ];
}
