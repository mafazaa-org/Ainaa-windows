import 'package:blocker_windows/config/dependency_injection/dependency_injection.dart';
import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:blocker_windows/features/ainna_protection/data/mock_data/ainna_protection_error_mock_data_impl.dart';
import 'package:blocker_windows/features/ainna_protection/domain/repositories/ainna_protection_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AinnaProtectionRepository, env: [Env.dev])
class AinnaTestProtectionRepositoryImpl implements AinnaProtectionRepository {
  AinnaProtectionErrorMockDataImpl errorMockData =
      AinnaProtectionErrorMockDataImpl();
  @override
  Future<AinnaProtectActionStatus> activate(String activationBatchPath) async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(Success(true));
    // final error = LocalizedString.fromArString(
    //   errorMockData.responseTimeOut['ar'],
    // );
    // return Future.value(Failure(error));
  }

  @override
  Future<AinnaProtectActionStatus> deActivate() async {
    return Future.value(Success(true));
  }

  @override
  Future<AinnaProtectActionStatus> reactivate(
    String activationBatchPath,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(Success(true));
  }

  @override
  Future<AinnaDomainProtectActionStatus> domainProtection(String url) async {
    await Future.delayed(const Duration(seconds: 2));
    // return Future.value(Success(url));
    final error = LocalizedString.fromArString(
      errorMockData.responseTimeOut['ar'],
    );
    return Future.value(Failure(error));
  }
}
