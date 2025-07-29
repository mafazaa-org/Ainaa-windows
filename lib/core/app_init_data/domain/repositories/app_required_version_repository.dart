import 'package:Ainaa/config/exceptions/fetch_exceptions.dart';
import 'package:Ainaa/constants/app_constants.dart';
import 'package:Ainaa/core/app_init_data/domain/entities/app_required_version_entity.dart';
import 'package:Ainaa/core/resources/data_state.dart';

typedef GetAppRequiredVersion = Result<AppRequiredVersion, FetchException>;

abstract class AppRequiredVersionRepository {
  final String currentVersion = AppConstants.appVersion;
  Future<GetAppRequiredVersion> checkLatestVersion();
}
