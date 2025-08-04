import 'package:bloc/bloc.dart';
import 'package:ainaa/features/version_check/domain/entities/app_needs_update_entity.dart';
import 'package:ainaa/features/version_check/domain/entities/app_required_version_entity.dart';
import 'package:ainaa/features/version_check/domain/repositories/app_required_version_repository.dart';
import 'package:ainaa/core/types/localized_string.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'get_app_version_state.dart';

@singleton
class GetAppRequiredVersionCubit extends Cubit<AppRequiredVersionState> {
  final AppRequiredVersionRepository _repository;
  GetAppRequiredVersionCubit(this._repository) : super(Initial());
  Logger logger = Logger();

  Future<void> loadAppVersion() async {
    void checkVersionState(AppRequiredVersion value) {
      final appNeedsUpdate = value.appNeedsUpdate;
      if (!value.isSameVersion && appNeedsUpdate != null) {
        if (appNeedsUpdate case AppNeedsVersionUpdate appNeedsVersionUpdate) {
          emit(
            Unmatched(
              value.latestVersion,
              appNeedsVersionUpdate.updateUrl,
              appNeedsVersionUpdate.isNecessaryUpdate,
              appNeedsVersionUpdate.reasonMessage,
            ),
          );
        } else if (appNeedsUpdate case AinnaNeedsUpdate ainnaNeedsUpdate) {
          emit(
            AinnaFilesUnmatched(
              value.latestVersion,
              ainnaNeedsUpdate.domainsTxtUrl,
              ainnaNeedsUpdate.protectBatchUrl,
              ainnaNeedsUpdate.isNecessaryUpdate,
              ainnaNeedsUpdate.reasonMessage,
            ),
          );
        } else {
          emit(Matched());
        }
      } else {
        emit(Matched());
      }
    }

    try {
      final result = await _repository.checkLatestVersion();
      logger.i(result);
      result.when(
        success: (value) => checkVersionState(value),
        failure: (error) => emit(Matched()),
      );
    } catch (e) {
      debugPrint('error: ${e.toString()}');
      emit(Matched());
    }
  }
}
