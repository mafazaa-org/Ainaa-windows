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

  Future<void> activate(String activationType, String phoneNumber) async {
    try {
      emit(AinaaProtectionInactive(isLoading: true));
      final response = await _repository.activate(activationType);
      response.when(
        success:
            (_) => emit(AinaaProtectionActive(DateTime.now(), activationType)),
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
      await _repository.deActivate();
      emit(AinaaProtectionInactive());
    } catch (e) {
      emit(
        AinaaProtectionInactive(
          errorMessage: LocalizedString.fromArString(e.toString()),
        ),
      );
    }
  }

  void restAinaaProtectionInactiveErrorMsg() {
    if (state is AinaaProtectionInactive) {
      emit(AinaaProtectionInactive());
    }
  }

  @override
  AinaaProtectionState? fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'active' &&
        json.containsKey('activationType') &&
        json.containsKey('activatedAt')) {
      return AinaaProtectionActive(
        DateTime.fromMillisecondsSinceEpoch(json['activatedAt']),
        json['activationType'],
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
        'activationType': state.activationType,
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
    HydratedBloc.storage.delete(
      "AinaaProtectionCubit",
    ); // Key matches your cubit name

    emit(AinaaProtectionInactive());
  }
}
