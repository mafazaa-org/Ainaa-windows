import 'package:blocker_windows/features/app_meta_data/data/mock_data/mock_meta_data.dart';
import 'package:blocker_windows/features/app_meta_data/domain/repositories/app_meta_data_repository.dart';
import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppMetaDataRepository)
class AppMetaDataTestRepositoryImpl implements AppMetaDataRepository {
  @override
  Future<GetAppMetaData> fetch() {
    return Future.value(Success(MockMetaData.mockMetaData.toEntity()));
  }
}
