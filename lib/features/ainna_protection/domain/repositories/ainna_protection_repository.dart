import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:blocker_windows/core/types/localized_string.dart';

typedef AinnaProtectActionStatus = Result<dynamic, LocalizedString>;

abstract class AinnaProtectionRepository {
  Future<AinnaProtectActionStatus> activate(String activationType);
  Future<AinnaProtectActionStatus> deActivate();
}
