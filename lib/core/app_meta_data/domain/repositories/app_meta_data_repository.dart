import 'package:blocker_windows/config/exceptions/fetch_exceptions.dart';
import 'package:blocker_windows/core/app_meta_data/domain/entities/app_meta_data_entity.dart';
import 'package:blocker_windows/core/resources/data_state.dart';

typedef GetAppMetaData = Result<AppMetaData, FetchException>;

abstract class AppMetaDataRepository {
  Future<GetAppMetaData> fetch();
}
