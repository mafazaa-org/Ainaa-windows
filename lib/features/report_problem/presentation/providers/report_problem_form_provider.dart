import 'package:blocker_windows/features/report_problem/domain/entities/report_problem_entity.dart';
import 'package:flutter/foundation.dart';

class ReportProblemFormProvider extends ChangeNotifier {
  String? _name;
  String? _phoneNumber;
  String? _emailAddress;
  String? _theProblem;

  String get getName => _name ?? '';
  void setName(String value) {
    _name = value;
    _doNotify();
  }

  String get getPhoneNumber => _phoneNumber ?? '';
  void setPhoneNumber(String value) {
    _phoneNumber = value;
    _doNotify();
  }

  String get getEmailAddress => _emailAddress ?? '';
  void setEmailAddress(String value) {
    _emailAddress = value;
    _doNotify();
  }

  String get getTheProblem => _theProblem ?? '';
  void setTheProblem(String value) {
    _theProblem = value;
    _doNotify();
  }

  bool get _isValidReport =>
      _name != null &&
      _phoneNumber != null &&
      _emailAddress != null &&
      _theProblem != null;

  ReportProblem? get getReportProblemData =>
      _isValidReport
          ? ReportProblem(
            getName,
            getPhoneNumber,
            getEmailAddress,
            getTheProblem,
          )
          : null;

  void _doNotify() {
    if (_isValidReport) {
      notifyListeners();
    }
  }

  void reset() {
    _name = null;
    _phoneNumber = null;
    _emailAddress = null;
    _theProblem = null;
  }
}
