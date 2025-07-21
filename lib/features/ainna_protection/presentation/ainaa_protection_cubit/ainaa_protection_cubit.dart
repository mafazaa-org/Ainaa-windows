import 'package:blocker_windows/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_protection_additional_option.dart';
import 'package:blocker_windows/features/ainna_protection/domain/repositories/ainna_protection_repository.dart';
import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'ainaa_protection_state.dart';

@singleton
class AinaaProtectionCubit extends HydratedCubit<AinaaProtectionState> {
  final AinnaProtectionRepository _repository;
  AinaaProtectionCubit(this._repository) : super(AinaaProtectionInactive());

  final logger = Logger(printer: PrettyPrinter());

  Future<void> activate(
    AinnaActivationType activationType,
    String activationBatchPath,
    String phoneNumber,
  ) async {
    try {
      emit(AinaaProtectionInactive(isLoading: true));
      final response = await _repository.activate(
        activationType: activationType,
        options: {},
        activationBatchPath: activationBatchPath,
      );
      response.when(
        success:
            (_) => emit(
              AinaaProtectionActive(
                activatedAt: DateTime.now(),
                activationType: activationType,
                activationBatchPath: activationBatchPath,
                //TODO: config adding a multiple options
                options: {},
              ),
            ),
        failure: (error) => emit(AinaaProtectionInactive(errorMessage: error)),
      );
    } catch (e) {
      emit(
        AinaaProtectionInactive(
          errorMessage: LocalizedString.fromArString(e.toString()),
        ),
      );
    }
  }

  Future<void> deactivate() async {
    try {
      emit(AinaaProtectionInactive(isLoading: true));
      await _repository.deactivate();
      emit(AinaaProtectionInactive());
    } catch (e) {
      emit(
        AinaaProtectionInactive(
          errorMessage: LocalizedString.fromArString(e.toString()),
        ),
      );
    }
  }

  Future<void> reactivate() async {
    if (state case AinaaProtectionActive activeState) {
      emit(activeState.copyWith(isLoading: true));
      final response = await _repository.reactivate(
        activationType: activeState.activationType,
        options: activeState.options,
        activationBatchPath: activeState.activationBatchPath,
      );
      response.when(
        success: (_) => emit(activeState.copyWith(isLoading: false)),
        failure: (error) => emit(activeState.copyWith(errorMessage: error)),
      );
    }
  }

  void restErrorMsg() {
    if (state is AinaaProtectionInactive) {
      emit(AinaaProtectionInactive());
    } else if (state case AinaaProtectionActive activeState) {
      emit(activeState.copyWith(isLoading: false, errorMessage: null));
    }
  }

  @override
  AinaaProtectionState? fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'active' &&
        json.containsKey('activationType') &&
        json.containsKey('activationBatchPath') &&
        json.containsKey('activatedAt') &&
        json.containsKey('options')) {
      return AinaaProtectionActive(
        activatedAt: DateTime.fromMillisecondsSinceEpoch(json['activatedAt']),
        activationType: AinnaActivationTypeJson.fromJson(
          json['activationType'],
        ),
        activationBatchPath: json['activationBatchPath'],
        options: AinnaProtectionAdditionalOptionsJson.fromJson(json['options']),
      );
    }
    return AinaaProtectionInactive();
  }

  @override
  Map<String, dynamic>? toJson(AinaaProtectionState state) {
    if (state is AinaaProtectionActive) {
      return {
        'type': 'active',
        'activatedAt': state.activatedAt.millisecondsSinceEpoch,
        'activationType': state.activationType.toJson(),
        'activationBatchPath': state.activationBatchPath,
        'options': state.options.toJson(),
      };
    } else {
      return {'type': 'inactive'};
    }
  }

  @override
  void onChange(Change<AinaaProtectionState> change) {
    logger.d('from: ${change.currentState} to: ${change.nextState}');
    super.onChange(change);
  }

  //for debugging purposes
  void resetState() {
    HydratedBloc.storage.delete("AinaaProtectionCubit");

    emit(AinaaProtectionInactive());
  }
}
