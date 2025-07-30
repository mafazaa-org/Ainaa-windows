/// Use [ErrorWrapper] to get the localized message for known errors.
class UploadException implements Exception {
  const UploadException(this.code);
  final String code;
}
