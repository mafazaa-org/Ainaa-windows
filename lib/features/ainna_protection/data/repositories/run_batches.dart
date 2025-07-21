import 'dart:convert' show utf8;
import 'dart:io' show File, Directory, Process;

import 'package:blocker_windows/constants/app_constants.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_protection_additional_option.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:logger/logger.dart';

void runAinnaActivateBatchFile({
  required AinnaActivationType activationType,
  required AinnaProtectionAdditionalOptions options,
  required String activationBatchPath,
}) async {
  final logger = Logger();
  final batchFile = File(activationBatchPath);

  if (!await batchFile.exists()) {
    logger.w('Batch file not found at ${batchFile.path}');
    return;
  }

  try {
    final process = await Process.start('cmd.exe', [
      '/c',
      'runas',
      '/user:Administrator',
      '${batchFile.path} apply ${activationType.name} ${options.contains(AinnaProtectionAdditionalOption.youtube)}',
    ], runInShell: true);

    process.stdout.transform(utf8.decoder).listen((data) {
      logger.i(data);
    });

    process.stderr.transform(utf8.decoder).listen((data) {
      logger.w(data);
    });

    final exitCode = await process.exitCode;
    logger.i('Process exited with code $exitCode');
  } catch (e) {
    logger.e('Error executing batch file: $e');
  }
}

Future<void> runAinnaActivateEmbeddedBatchFile({
  required AinnaActivationType activationType,
  required AinnaProtectionAdditionalOptions options,
}) async {
  final logger = Logger();
  final tempDir = Directory.systemTemp;
  final tempBatch = File('${tempDir.path}/${AppConstants.batchName}');

  try {
    // Load from assets and copy to temp
    final batchContent = await rootBundle.loadString(AppConstants.batchUrl);
    await tempBatch.writeAsString(batchContent, flush: true);

    // Execute with UAC elevation
    final process = await Process.start('powershell', [
      '-Command',
      'Start-Process',
      'cmd.exe',
      '-ArgumentList',
      '/c "${tempBatch.path}" apply ${activationType.name} ${options.contains(AinnaProtectionAdditionalOption.youtube)}',
      '-Verb',
      'RunAs',
    ], runInShell: true);

    process.stdout.transform(utf8.decoder).listen(logger.i);
    process.stderr.transform(utf8.decoder).listen(logger.w);

    final exitCode = await process.exitCode;
    logger.i('Process exited with code $exitCode');
  } catch (e) {
    logger.e('Error executing batch file: $e');
  } finally {
    await tempBatch.delete();
  }
}

Future<void> runAinnaDeactivateEmbeddedBatchFile() async {
  final logger = Logger();
  final tempDir = Directory.systemTemp;
  final tempBatch = File('${tempDir.path}/${AppConstants.batchName}');

  try {
    // Load from assets and copy to temp
    final batchContent = await rootBundle.loadString(AppConstants.batchUrl);
    await tempBatch.writeAsString(batchContent, flush: true);

    // Execute with UAC elevation
    final process = await Process.start('powershell', [
      '-Command',
      'Start-Process',
      'cmd.exe',
      '-ArgumentList',
      '/c "${tempBatch.path}" deactivate',
      '-Verb',
      'RunAs',
    ], runInShell: true);

    process.stdout.transform(utf8.decoder).listen(logger.i);
    process.stderr.transform(utf8.decoder).listen(logger.w);

    final exitCode = await process.exitCode;
    logger.i('Process exited with code $exitCode');
  } catch (e) {
    logger.e('Error executing batch file: $e');
  } finally {
    await tempBatch.delete();
  }
}

Future<void> runDomainProtectionEmbeddedBatchFile(String url) async {
  final logger = Logger();
  final tempDir = Directory.systemTemp;
  final tempBatch = File('${tempDir.path}/${AppConstants.batchName}');

  try {
    // Load from assets and copy to temp
    final batchContent = await rootBundle.loadString(AppConstants.batchUrl);
    await tempBatch.writeAsString(batchContent, flush: true);

    // Execute with UAC elevation
    final process = await Process.start('powershell', [
      '-Command',
      'Start-Process',
      'cmd.exe',
      '-ArgumentList',
      '/c "${tempBatch.path}" add_domain "0.0.0.0 $url"',
      '-Verb',
      'RunAs',
    ], runInShell: true);

    process.stdout.transform(utf8.decoder).listen(logger.i);
    process.stderr.transform(utf8.decoder).listen(logger.w);

    final exitCode = await process.exitCode;
    logger.i('Process exited with code $exitCode');
  } catch (e) {
    logger.e('Error executing batch file: $e');
  } finally {
    await tempBatch.delete();
  }
}
