part of 'report_problem_cubit.dart';

sealed class ReportProblemState extends Equatable {
  const ReportProblemState();

  @override
  List<Object> get props => [];
}

final class ReportProblemInitial extends ReportProblemState {}

final class ReportProblemLoading extends ReportProblemState {}

final class ReportProblemSent extends ReportProblemState {}

final class ReportProblemFailed extends ReportProblemState {
  final String code;
  const ReportProblemFailed(this.code);
  @override
  List<Object> get props => [code];
}
