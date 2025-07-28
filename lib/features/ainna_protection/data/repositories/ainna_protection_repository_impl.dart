import 'package:blocker_windows/config/dependency_injection/dependency_injection.dart';
import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:blocker_windows/features/ainna_protection/data/repositories/run_batches.dart';
import 'package:blocker_windows/features/ainna_protection/domain/repositories/ainna_protection_repository.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_protection_additional_option.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Singleton(as: AinnaProtectionRepository, env: [Env.prod])
class AinnaProtectionRepositoryImpl extends AinnaProtectionRepository {
  final logger = Logger();

  @override
  Future<AinnaProtectActionStatus> activate({
    required AinnaActivationType activationType,
    required AinnaProtectionAdditionalOptions options,
    required String activationBatchPath,
  }) async {
    try {
      await runAinnaActivateEmbeddedBatchFile(
        activationType: activationType,
        options: options,
        // activationBatchPath: activationBatchPath,
      );
      // TODO: send the phone number to the google cheet
      return Future.value(Success(true));
    } catch (e) {
      logger.w('Failed activate, to run .bat file: $e');
      final error = LocalizedString.fromArString(e.toString());
      return Future.value(Failure(error));
    }
  }

  @override
  Future<AinnaProtectActionStatus> deactivate() async {
    try {
      await runAinnaDeactivateEmbeddedBatchFile();
      return Future.value(Success(true));
    } catch (e) {
      logger.w('Failed deactivate, to run .bat file: $e');
      final error = LocalizedString.fromArString(e.toString());
      return Future.value(Failure(error));
    }
  }

  @override
  Future<AinnaProtectActionStatus> reactivate({
    required AinnaActivationType activationType,
    required AinnaProtectionAdditionalOptions options,
    required String activationBatchPath,
  }) async {
    try {
      await runAinnaActivateEmbeddedBatchFile(
        activationType: activationType,
        options: options,
        // activationBatchPath: activationBatchPath,
      );

      return Future.value(Success(true));
    } catch (e) {
      logger.w('Failed reactivate, to run .bat file: $e');
      final error = LocalizedString.fromArString(e.toString());
      return Future.value(Failure(error));
    }
  }

  @override
  Future<AinnaDomainProtectActionStatus> domainProtection(String url) async {
    try {
      await runDomainProtectionEmbeddedBatchFile(url);
      return Future.value(Success(url));
    } catch (e) {
      logger.w('Failed reactivate, to run .bat file: $e');
      final error = LocalizedString.fromArString(e.toString());
      return Future.value(Failure(error));
    }
  }
}
