/// Use [ErrorWrapper] to get the localized message for known errors.
class FetchException implements Exception {
  const FetchException(this.code);
  final String code;
}
