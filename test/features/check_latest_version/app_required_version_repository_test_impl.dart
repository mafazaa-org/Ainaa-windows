import 'dart:convert';

import 'package:blocker_windows/config/exceptions/fetch_exceptions.dart';
import 'package:blocker_windows/features/version_check/data/models/app_required_version_model.dart';
import 'package:blocker_windows/features/version_check/domain/repositories/app_required_version_repository.dart';
import 'package:blocker_windows/core/constants/app_urls.dart';
import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Singleton(as: AppRequiredVersionRepository)
class AppRequiredVersionRepositoryTestImpl
    extends AppRequiredVersionRepository {
  final http.Client client;
  AppRequiredVersionRepositoryTestImpl({http.Client? client})
    : client = client ?? http.Client();
  @override
  Future<GetAppRequiredVersion> checkLatestVersion() async {
    final logger = Logger();
    try {
      final response = await client.get(Uri.parse(AppUrls.checkVersion));
      final body = jsonDecode(response.body);
      logger.i('Response Body: $body');
      return Success(AppRequiredVersionModel.fromJson(body).toEntity());
    } catch (e) {
      logger.e(e.toString());
      return Failure(FetchException(e.toString()));
    }
  }
}
