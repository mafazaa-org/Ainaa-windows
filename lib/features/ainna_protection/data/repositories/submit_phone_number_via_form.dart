import 'package:ainaa/core/constants/app_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

@Deprecated('This function is no longer needed. Do not use it.')
Future<void> submitPhoneNumberViaForm(String phoneNumber) async {
  // debugPrint('in submitPhoneNumberViaForm');
  try {
    final uri = Uri.parse(AppUrls.phoneNumberForm);

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {AppUrls.phoneNumberEntryId: phoneNumber},
    );
    if (response.statusCode == 200) {
      debugPrint('phone number submitted to form: $phoneNumber');
    } else {
      debugPrint('error occurred: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('error occurred: ${e.toString()}');
  }
}
