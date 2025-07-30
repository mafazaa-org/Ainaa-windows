import 'dart:convert' show utf8;
import 'dart:io' show File, Directory, Process;

import 'package:blocker_windows/config/exceptions/upload_exception.dart';
import 'package:blocker_windows/constants/app_constants.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_protection_additional_option.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:logger/logger.dart';

Future<void> runAinnaActivateEmbeddedBatchFile({
  required AinnaActivationType activationType,
  required AinnaProtectionAdditionalOptions options,
}) async {
  await _runBatchScript(
    'apply ${activationType.name} ${options.contains(AinnaProtectionAdditionalOption.youtube)}',
  );
}

Future<void> runAinnaDeactivateEmbeddedBatchFile() async {
  await _runBatchScript("deactivate");
}

Future<void> runDomainProtectionEmbeddedBatchFile(String url) async {
  await _runBatchScript('add_domain "0.0.0.0 $url"');
}

Future<void> _runBatchScript(String args) async {
  final logger = Logger();
  final tempDir = Directory.systemTemp;
  final tempBatch = File('${tempDir.path}\\${AppConstants.batchName}');
  final domainsFile = File('${tempDir.path}\\domains.txt');
  final youtubeFile = File('${tempDir.path}\\youtube.txt');

  try {
    // Load all required files from assets and copy to temp
    final batchContent = await rootBundle.loadString(AppConstants.batchUrl);
    final domainsContent = await rootBundle.loadString(AppConstants.domainsUrl);
    final youtubeContent = await rootBundle.loadString(AppConstants.youtubeUrl);

    // Write all files to temp directory
    await tempBatch.writeAsString(batchContent, flush: true);
    await domainsFile.writeAsString(domainsContent, flush: true);
    await youtubeFile.writeAsString(youtubeContent, flush: true);

    // Execute with UAC elevation from the temp directory
    final process = await Process.start('cmd.exe', [
      '/k',
      '${tempBatch.path} $args',
    ], runInShell: true);

    process.stdout.transform(utf8.decoder).listen(logger.i);
    process.stderr.transform(utf8.decoder).listen(logger.w);

    final exitCode = await process.exitCode;
    if (exitCode != 0) {
      throw UploadException('Script failed');
    }
    logger.i('Process exited with code $exitCode');
  } catch (e) {
    logger.e('Error executing batch file: $e');
    rethrow;
  } finally {
    await tempBatch.delete();
    await domainsFile.delete();
    await youtubeFile.delete();
  }
}
