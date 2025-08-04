import 'package:ainaa/config/exceptions/fetch_exceptions.dart';
import 'package:ainaa/constants/app_constants.dart';
import 'package:ainaa/features/version_check/domain/entities/app_required_version_entity.dart';
import 'package:ainaa/core/resources/data_state.dart';

typedef GetAppRequiredVersion = Result<AppRequiredVersion, FetchException>;

abstract class AppRequiredVersionRepository {
  final String currentVersion = AppConstants.appVersion;
  Future<GetAppRequiredVersion> checkLatestVersion();
}
