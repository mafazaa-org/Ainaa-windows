import 'package:blocker_windows/config/dependency_injection/dependency_injection.dart';
import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:blocker_windows/features/ainna_protection/data/mock_data/ainna_protection_error_mock_data_impl.dart';
import 'package:blocker_windows/features/ainna_protection/domain/repositories/ainna_protection_repository.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_protection_additional_option.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Singleton(as: AinnaProtectionRepository, env: [Env.dev])
class AinnaTestProtectionRepositoryImpl implements AinnaProtectionRepository {
  AinnaProtectionErrorMockDataImpl errorMockData =
      AinnaProtectionErrorMockDataImpl();
  Logger logger = Logger();
  @override
  Future<AinnaProtectActionStatus> activate({
    required AinnaActivationType activationType,
    required AinnaProtectionAdditionalOptions options,
    required String activationBatchPath,
    required String phoneNumber,
  }) async {
    logger.i(
      'activationBatchPath: $activationBatchPath \n activationType: ${activationType.name} \n options: $options',
    );
    await Future.delayed(const Duration(seconds: 2));
    // await submitPhoneNumberViaForm(phoneNumber);
    return Future.value(Success(true));
    // final error = LocalizedString.fromArString(
    //   errorMockData.responseTimeOut['ar'],
    // );
    // return Future.value(Failure(error));
  }

  @override
  Future<AinnaProtectActionStatus> deactivate() async {
    return Future.value(Success(true));
  }

  @override
  Future<AinnaProtectActionStatus> reactivate({
    required AinnaActivationType activationType,
    required AinnaProtectionAdditionalOptions options,
    required String activationBatchPath,
  }) async {
    logger.i(
      'activationBatchPath: $activationBatchPath \n activationType: ${activationType.name} \n options: $options',
    );
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(Success(true));
  }

  @override
  Future<AinnaDomainProtectActionStatus> domainProtection(String url) async {
    logger.i('url: $url');
    await Future.delayed(const Duration(seconds: 2));
    // return Future.value(Success(url));
    final error = LocalizedString.fromArString(
      errorMockData.responseTimeOut['ar'],
    );
    return Future.value(Failure(error));
  }
}
