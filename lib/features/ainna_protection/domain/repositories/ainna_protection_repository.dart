import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:blocker_windows/core/types/localized_string.dart';

typedef AinnaProtectActionStatus = Result<dynamic, LocalizedString>;
typedef AinnaDomainProtectActionStatus = Result<String, LocalizedString>;

abstract class AinnaProtectionRepository {
  Future<AinnaProtectActionStatus> activate(String activationBatchPath);
  Future<AinnaProtectActionStatus> reactivate(String activationBatchPath);
  Future<AinnaProtectActionStatus> deActivate();

  Future<AinnaDomainProtectActionStatus> domainProtection(String url);
}
