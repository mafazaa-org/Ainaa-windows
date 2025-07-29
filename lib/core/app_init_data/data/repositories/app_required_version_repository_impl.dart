import 'dart:convert';

import 'package:Ainaa/config/exceptions/fetch_exceptions.dart';
import 'package:Ainaa/core/app_init_data/data/models/app_required_version_model.dart';
import 'package:Ainaa/core/app_init_data/domain/repositories/app_required_version_repository.dart';
import 'package:Ainaa/core/constants/app_urls.dart';
import 'package:Ainaa/core/resources/data_state.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Singleton(as: AppRequiredVersionRepository)
class AppRequiredVersionRepositoryImpl extends AppRequiredVersionRepository {
  @override
  Future<GetAppRequiredVersion> checkLatestVersion() async {
    final logger = Logger();
    try {
      final response = await http.get(Uri.parse(AppUrls.checkVersion));
      final body = jsonDecode(response.body);
      logger.i('Response Body: $body');
      return Success(AppRequiredVersionModel.fromJson(body).toEntity());
    } catch (e) {
      logger.e(e.toString());
      return Failure(FetchException(e.toString()));
    }
  }
}
