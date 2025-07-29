import 'package:Ainaa/config/exceptions/fetch_exceptions.dart';
import 'package:Ainaa/core/app_init_data/domain/entities/app_meta_data_entity.dart';
import 'package:Ainaa/core/resources/data_state.dart';

typedef GetAppMetaData = Result<AppMetaData, FetchException>;

abstract class AppMetaDataRepository {
  Future<GetAppMetaData> fetch();
}
