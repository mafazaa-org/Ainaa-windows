import 'package:bloc/bloc.dart';
import 'package:blocker_windows/config/dependency_injection/dependency_injection.dart';
import 'package:blocker_windows/features/app_meta_data/domain/entities/app_meta_data_entity.dart';
import 'package:blocker_windows/features/app_meta_data/domain/repositories/app_meta_data_repository.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'get_app_meta_data_state.dart';

@singleton
class GetAppMetaDataCubit extends Cubit<AppMetaDataState> {
  final AppMetaDataRepository _repository;
  GetAppMetaDataCubit(this._repository) : super(AppMetaDataInitialState());

  Future<void> loadInitialMetaData() async {
    try {
      emit(AppMetaDataLoadingState());

      final result = await _repository.fetch();

      result.when(
        success: (value) => emit(AppMetaDataFetchedState(value)),
        failure: (error) => emit(AppMetaDataFailedState(error.code)),
      );
    } catch (e) {
      // check if AinaaProtectionCubit in an active state
      final ainaaProtectionCubit = getIt<AinaaProtectionCubit>();
      final ainaaProtectionState = ainaaProtectionCubit.state;

      if (ainaaProtectionState is AinaaProtectionInactive) {
        emit(AppMetaDataOfflineState());
      } else {
        emit(AppMetaDataFailedState('no_internet_connection'));
      }
    }
  }
}
