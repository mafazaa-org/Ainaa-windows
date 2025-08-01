import 'package:bloc/bloc.dart';
import 'package:blocker_windows/features/report_problem/domain/entities/report_problem_entity.dart';
import 'package:blocker_windows/features/report_problem/domain/repositories/report_problem_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'report_problem_state.dart';

@injectable
class ReportProblemCubit extends Cubit<ReportProblemState> {
  final ReportProblemRepository _repository;
  ReportProblemCubit(this._repository) : super(ReportProblemInitial());

  Future<void> submitProblem(ReportProblem reportProblemData) async {
    emit(ReportProblemLoading());
    try {
      final result = await _repository.reportProblemViaForm(reportProblemData);
      result.when(
        success: (_) => emit(ReportProblemSent()),
        failure: (e) => emit(ReportProblemFailed(e.code)),
      );
    } catch (e) {
      emit(ReportProblemFailed('no_internet_connection'));
    }
  }

  void reset() {
    emit(ReportProblemInitial());
  }
}
