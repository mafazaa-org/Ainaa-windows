import 'package:blocker_windows/config/exceptions/upload_exception.dart';
import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:blocker_windows/features/report_problem/domain/entities/report_problem_entity.dart';

typedef ReportProblemStatus = Result<Null, UploadException>;

abstract class ReportProblemRepository {
  Future<ReportProblemStatus> reportProblemViaForm(ReportProblem problem);
}
