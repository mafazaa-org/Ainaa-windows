import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChosenProtectionProvider extends ChangeNotifier {
  String? _option;
  String? _phoneNumber;

  String? get chosenOption => _option;
  String? get phoneNumber => _phoneNumber;

  void updateChosenOption(String? newOption) {
    if (newOption != chosenOption) {
      _option = newOption;
      notifyListeners();
    }
  }

  void updatePhoneNumber(String? newPhoneNumber) {
    if (newPhoneNumber != phoneNumber) {
      debugPrint('newPhoneNumber: $newPhoneNumber');
      _phoneNumber = newPhoneNumber;
      notifyListeners();
    }
  }
}
