import 'package:blocker_windows/config/exceptions/fetch_exceptions.dart';
import 'package:blocker_windows/constants/app_constants.dart';
import 'package:blocker_windows/core/app_init_data/domain/entities/app_required_version_entity.dart';
import 'package:blocker_windows/core/resources/data_state.dart';

typedef GetAppRequiredVersion = Result<AppRequiredVersion, FetchException>;

abstract class AppRequiredVersionRepository {
  final String currentVersion = AppConstants.appVersion;
  Future<GetAppRequiredVersion> checkLatestVersion();
}
