import 'package:ainaa/config/exceptions/fetch_exceptions.dart';
import 'package:ainaa/features/app_meta_data/domain/entities/app_meta_data_entity.dart';
import 'package:ainaa/core/resources/data_state.dart';

typedef GetAppMetaData = Result<AppMetaData, FetchException>;

abstract class AppMetaDataRepository {
  Future<GetAppMetaData> fetch();
}
