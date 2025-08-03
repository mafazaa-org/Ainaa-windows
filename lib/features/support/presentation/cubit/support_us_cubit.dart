import 'package:bloc/bloc.dart';
import 'package:blocker_windows/features/support/domain/repositories/support_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'support_us_state.dart';

@singleton
class SupportUsCubit extends Cubit<SupportUsState> {
  final SupportRepository _repository;
  SupportUsCubit(this._repository) : super(SupportUsInitial());

  Future<void> joinUs() async {
    final success = await _repository.joinUs();
    if (!success) {
      emit(SupportUsFailed());
    }
  }

  Future<void> financialSupport() async {
    final success = await _repository.financialSupport();
    if (!success) {
      emit(SupportUsFailed());
    }
  }

  void rest() {
    emit(SupportUsInitial());
  }
}
