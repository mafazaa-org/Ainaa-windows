import 'package:ainaa/config/dependency_injection/dependency_injection.dart';
import 'package:ainaa/config/exceptions/upload_exception.dart';
import 'package:ainaa/core/resources/data_state.dart';
import 'package:ainaa/features/report_problem/domain/entities/report_problem_entity.dart';
import 'package:ainaa/features/report_problem/domain/repositories/report_problem_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Singleton(as: ReportProblemRepository, env: [Env.dev])
class ReportProblemRepositoryTestImpl extends ReportProblemRepository {
  @override
  Future<ReportProblemStatus> reportProblemViaForm(
    ReportProblem problem,
  ) async {
    Logger logger = Logger();
    logger.i('Report Data: ${problem.toString()}');
    Future.delayed(Duration(seconds: 3));
    return Success(null);
    // return Failure(UploadException('invalid report'));
  }
}
