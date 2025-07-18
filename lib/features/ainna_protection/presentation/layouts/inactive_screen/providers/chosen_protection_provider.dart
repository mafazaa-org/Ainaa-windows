import 'package:blocker_windows/core/utils/text_form_validations.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChosenProtectionProvider extends ChangeNotifier {
  String? _option;
  String? _optionBatchPath;
  String? _phoneNumber;

  String? get chosenOption => _option;
  String? get optionBatchPath => _optionBatchPath;
  String? get phoneNumber => _phoneNumber;
  bool get validPhoneNumber =>
      TextFormValidations.validPhoneNumber(phoneNumber);

  void updateChosenOption(String newOption, String newOptionBatchPath) {
    if (newOption != chosenOption) {
      _option = newOption;
      _optionBatchPath = newOptionBatchPath;
      notifyListeners();
    }
  }

  void updatePhoneNumber(String? newPhoneNumber) {
    if (newPhoneNumber != phoneNumber) {
      // debugPrint('newPhoneNumber: $newPhoneNumber');
      _phoneNumber = newPhoneNumber;
      notifyListeners();
    }
  }

  void reset() {
    _option = null;
    _optionBatchPath = null;
    _phoneNumber = null;
  }
}
