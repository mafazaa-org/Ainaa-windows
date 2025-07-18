import 'dart:io';
import 'package:blocker_windows/config/dependency_injection/dependency_injection.dart';
import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:blocker_windows/features/ainna_protection/domain/repositories/ainna_protection_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Singleton(as: AinnaProtectionRepository, env: [Env.prod])
class AinnaProtectionRepositoryImpl extends AinnaProtectionRepository {
  @override
  Future<AinnaProtectActionStatus> activate(String activationBatchPath) {
    final logger = Logger();
    try {
      // TODO: test the batch in windows
      runBatchFile(activationBatchPath);
      // TODO: send the phone number to the google cheet
      return Future.value(Success(true));
    } catch (e) {
      logger.w('Failed to run .bat file: $e');
      final error = LocalizedString.fromArString(e.toString());
      return Future.value(Failure(error));
    }
  }

  @override
  Future<AinnaProtectActionStatus> deActivate() {
    // TODO: implement deActivate
    throw UnimplementedError();
  }

  @override
  Future<AinnaProtectActionStatus> reactivate(String activationBatchPath) {
    final logger = Logger();
    try {
      // TODO: test reactivate the batch in windows
      runBatchFile(activationBatchPath);

      return Future.value(Success(true));
    } catch (e) {
      logger.w('Failed to run .bat file: $e');
      final error = LocalizedString.fromArString(e.toString());
      return Future.value(Failure(error));
    }
  }

  void runBatchFile(String activationBatchPath) async {
    final logger = Logger();
    final result = await Process.start('cmd.exe', [
      '/c',
      activationBatchPath,
    ], runInShell: true);

    result.stdout.transform(SystemEncoding().decoder).listen((data) {
      logger.i(data);
    });

    result.stderr.transform(SystemEncoding().decoder).listen((data) {
      logger.w(data);
    });
  }

  @override
  Future<AinnaDomainProtectActionStatus> domainProtection(String url) {
    // TODO: implement activateSpecificDomain
    throw UnimplementedError();
  }
}
