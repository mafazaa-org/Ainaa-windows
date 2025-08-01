import 'package:blocker_windows/features/report_problem/domain/entities/report_problem_entity.dart';

class ReportProblemModel {
  final String name;
  final String phoneNumber;
  final String emailAddress;
  final String theProblem;

  const ReportProblemModel(
    this.name,
    this.phoneNumber,
    this.emailAddress,
    this.theProblem,
  );

  ReportProblem toEntity() {
    return ReportProblem(name, phoneNumber, emailAddress, theProblem);
  }
}
