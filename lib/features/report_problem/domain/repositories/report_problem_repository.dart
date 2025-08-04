import 'package:ainaa/config/exceptions/upload_exception.dart';
import 'package:ainaa/core/resources/data_state.dart';
import 'package:ainaa/features/report_problem/domain/entities/report_problem_entity.dart';

typedef ReportProblemStatus = Result<Null, UploadException>;

abstract class ReportProblemRepository {
  Future<ReportProblemStatus> reportProblemViaForm(ReportProblem problem);
}
