import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String uri) async {
  final url = Uri.parse(uri);

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    debugPrint('couldn\'t launch');
  }
}
