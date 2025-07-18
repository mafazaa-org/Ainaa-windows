import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:blocker_windows/features/ainna_protection/domain/repositories/ainna_protection_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'ainaa_domain_protection_state.dart';

@singleton
class AinaaDomainProtectionCubit
    extends HydratedCubit<AinaaDomainProtectionState> {
  final AinnaProtectionRepository _repository;
  AinaaDomainProtectionCubit(this._repository)
    : super(AinaaDomainProtectionState());

  Future<void> domainProtection(String url) async {
    final logger = Logger();
    emit(state.copyWith(isProcessing: true));
    try {
      final result = await _repository.domainProtection(url);
      result.when(
        success: (value) => emit(state.copyWith(protectedDomain: value)),
        failure: (error) => emit(state.copyWith(errorMessage: error)),
      );
    } catch (e) {
      logger.e(e.toString());
      final errorMessage = LocalizedString.fromArString(e.toString());
      emit(state.copyWith(errorMessage: errorMessage));
    }
  }

  void restErrorMsg() {
    emit(state.copyWith(errorMessage: null));
  }

  @override
  AinaaDomainProtectionState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('protectedDomains') &&
        json['protectedDomains'] is List<String>) {
      return AinaaDomainProtectionState(
        protectedDomains: json['protectedDomains'],
      );
    }
    return AinaaDomainProtectionState();
  }

  @override
  Map<String, dynamic>? toJson(AinaaDomainProtectionState state) {
    return {'protectedDomains': state.protectedDomains};
  }
}
