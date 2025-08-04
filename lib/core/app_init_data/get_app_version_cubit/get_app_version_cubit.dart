import 'package:bloc/bloc.dart';
import 'package:ainaa/core/app_init_data/domain/repositories/app_required_version_repository.dart';
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
    try {
      final result = await _repository.checkLatestVersion();
      logger.i(result);
      result.when(
        success: (value) => emit(Matched()),
        failure: (error) => emit(Matched()),
      );
    } catch (e) {
      debugPrint('error: ${e.toString()}');
      emit(Matched());
    }
  }
}
