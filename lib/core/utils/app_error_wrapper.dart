import 'package:blocker_windows/l10n/generated/app_localizations.dart';

class AppErrorMapper {
  static String map(String code, AppLocalizations appLocalizations) {
    switch (code) {
      case 'something went wrong':
        return appLocalizations.something_went_wrong;
      case 'no_internet_connection':
        return appLocalizations.no_internet_connection;
      case 'Script failed':
        return appLocalizations.script_failed;
      case 'invalid report':
        return appLocalizations.invalid_input;
      default:
        return appLocalizations.something_went_wrong;
    }
  }
}
