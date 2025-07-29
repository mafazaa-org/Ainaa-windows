import 'package:Ainaa/core/resources/data_state.dart';
import 'package:Ainaa/core/types/localized_string.dart';
import 'package:Ainaa/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:Ainaa/features/ainna_protection/enums/ainna_protection_additional_option.dart';

typedef AinnaProtectActionStatus = Result<dynamic, LocalizedString>;
typedef AinnaDomainProtectActionStatus = Result<String, LocalizedString>;

abstract class AinnaProtectionRepository {
  Future<AinnaProtectActionStatus> activate({
    required AinnaActivationType activationType,
    required AinnaProtectionAdditionalOptions options,
    required String activationBatchPath,
  });
  Future<AinnaProtectActionStatus> reactivate({
    required AinnaActivationType activationType,
    required AinnaProtectionAdditionalOptions options,
    required String activationBatchPath,
  });
  Future<AinnaProtectActionStatus> deactivate();

  Future<AinnaDomainProtectActionStatus> domainProtection(String url);
}
