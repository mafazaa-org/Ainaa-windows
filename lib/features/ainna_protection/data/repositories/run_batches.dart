import 'dart:convert' show utf8;
import 'dart:io' show Directory, File, Process;

import 'package:ainaa/config/exceptions/upload_exception.dart';
import 'package:ainaa/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:ainaa/features/ainna_protection/enums/ainna_protection_additional_option.dart';
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

  final tempDir = Directory.systemTemp.createTempSync('ainaa_batch_');
  final destDir = Directory(tempDir.path);

  try {
    // Execute with UAC elevation from the temp directory

    // Copy batch files from assets/batch to the temp directory
    final batchAssets = [
      'protect.bat',
      'domains.txt',
      'youtube.txt',
    ]; // Add more batch files if needed
    for (final fileName in batchAssets) {
      final assetPath = 'assets/batch/$fileName';
      final newFile = File('${destDir.path}\\$fileName');
      await newFile.writeAsString(
        await rootBundle.loadString(assetPath),
        flush: true,
      );
    }

    final process = await Process.start(
      'cmd.exe',
      ['/c', 'protect.bat $args'],
      runInShell: true,
      workingDirectory: destDir.path,
    );

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
    if (await destDir.exists()) {
      logger.i("deleting the temp dir");
      await destDir.delete(recursive: true);
    }
  }
}
