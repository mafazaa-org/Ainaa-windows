import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_protection_additional_option.dart';

typedef AinnaProtectActionStatus = Result<dynamic, LocalizedString>;
typedef AinnaDomainProtectActionStatus = Result<String, LocalizedString>;

abstract class AinnaProtectionRepository {
  Future<AinnaProtectActionStatus> activate({
    required AinnaActivationType activationType,
    required AinnaProtectionAdditionalOptions options,
    required String activationBatchPath,
    required String phoneNumber,
  });
  Future<AinnaProtectActionStatus> reactivate({
    required AinnaActivationType activationType,
    required AinnaProtectionAdditionalOptions options,
    required String activationBatchPath,
  });
  Future<AinnaProtectActionStatus> deactivate();

  Future<AinnaDomainProtectActionStatus> domainProtection(String url);
}
