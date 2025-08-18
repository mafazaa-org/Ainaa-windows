import 'package:ainaa/config/dependency_injection/dependency_injection.dart';
import 'package:ainaa/config/exceptions/upload_exception.dart';
import 'package:ainaa/core/constants/app_urls.dart';
import 'package:ainaa/core/resources/data_state.dart';
import 'package:ainaa/features/report_problem/domain/entities/report_problem_entity.dart';
import 'package:ainaa/features/report_problem/domain/repositories/report_problem_repository.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Singleton(as: ReportProblemRepository, env: [Env.prod])
class ReportProblemRepositoryImpl extends ReportProblemRepository {
  @override
  Future<ReportProblemStatus> reportProblemViaForm(
    ReportProblem problem,
  ) async {
    Logger logger = Logger();
    logger.i('problem: ${problem.toString()}');
    try {
      final uri = Uri.parse(AppUrls.reportProblemForm);

      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          AppUrls.reportNameEntryId: problem.name,
          AppUrls.reportEmailAddressEntryId: problem.emailAddress,
          AppUrls.reportPhoneNumberEntryId: problem.phoneNumber,
          AppUrls.reportTheProblemEntryId: problem.theProblem,
        },
      );
      logger.i('response status code: ${response.statusCode}');
      logger.i('response body: ${response.body}');

      if (response.statusCode == 200) {
        return Success(null);
      } else {
        return Failure(UploadException('something went wrong'));
      }
    } catch (e) {
      return Failure(UploadException('no internet connection'));
    }
  }
}
