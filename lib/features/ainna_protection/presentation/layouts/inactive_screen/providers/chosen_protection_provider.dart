import 'package:ainaa/features/app_meta_data/domain/entities/ainna_protection_level_entity.dart';
import 'package:ainaa/features/ainna_protection/enums/ainna_activation_type.dart';
import 'package:ainaa/features/ainna_protection/enums/ainna_protection_additional_option.dart';
import 'package:ainaa/core/utils/text_form_validations.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChosenProtectionProvider extends ChangeNotifier {
  AinnaProtectionLevel? _ainnaProtectionLevel;
  final AinnaProtectionAdditionalOptions _additionalOptions = const {};
  String? _phoneNumber;

  AinnaActivationType? get chosenOption =>
      _ainnaProtectionLevel?.activationType;
  String? get optionBatchPath => _ainnaProtectionLevel?.optionBatchPath;
  String? get phoneNumber => _phoneNumber;
  bool get validPhoneNumber =>
      TextFormValidations.validPhoneNumber(phoneNumber);

  void updateChosenOption(AinnaProtectionLevel ainnaProtectionLevel) {
    _ainnaProtectionLevel = ainnaProtectionLevel;
    notifyListeners();
  }

  void updatePhoneNumber(String? newPhoneNumber) {
    if (newPhoneNumber != phoneNumber) {
      // debugPrint('newPhoneNumber: $newPhoneNumber');
      _phoneNumber = newPhoneNumber;
      notifyListeners();
    }
  }

  bool addAdditionalOption(AinnaProtectionAdditionalOption option) {
    return _additionalOptions.add(option);
  }

  bool removeAdditionalOption(AinnaProtectionAdditionalOption option) {
    return _additionalOptions.remove(option);
  }

  void reset() {
    _ainnaProtectionLevel = null;
    _phoneNumber = null;
  }
}
