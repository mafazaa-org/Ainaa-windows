import 'package:blocker_windows/config/exceptions/fetch_exceptions.dart';
import 'package:blocker_windows/config/exceptions/upload_exception.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';

class ErrorMapper {
  static String mapFetchException(
    FetchException exception,
    AppLocalizations appLocalizations,
  ) {
    switch (exception.code) {
      case 'something went wrong':
        return appLocalizations.something_went_wrong;
      default:
        return appLocalizations.something_went_wrong;
    }
  }

  static String mapUploadException(
    UploadException exception,
    AppLocalizations appLocalizations,
  ) {
    switch (exception.code) {
      case 'Script failed':
        return appLocalizations.script_failed;
      default:
        return appLocalizations.something_went_wrong;
    }
  }
}
