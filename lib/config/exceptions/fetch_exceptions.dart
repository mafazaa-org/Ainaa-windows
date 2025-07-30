/// Use [ErrorWrapper] to get the localized message for known errors.
///
/// This is useful when you want to catch errors at the repository or service level
/// and display meaningful messages to the user using [AppLocalizations].
///
/// Example1:
///
/// ```dart
/// try {
///   await repository.fetchData();
/// } catch (e) {
///   final message = ErrorWrapper.getLocalizedMessage(
///     error: e,
///     localizations: AppLocalizations.of(context)!,
///   );
///   showSnackBar(context, message);
/// }
/// ```
///
///
/// Example2:
///
/// ```dart
/// final result = await authRepository.login(username, password);
///
/// result.when(
///   success: (user) {
///     navigateToHomeScreen();
///   },
///   failure: (error) {
///     final message = AppLocalizations.of(context)!.get(error.key);
///     showSnackBar(context, message);
///   },
/// );
/// ```
///
/// You can customize [ErrorWrapper.getLocalizedMessage] to map error codes
/// to localization keys internally.
///
/// Note: Do **not** use [BuildContext] inside repository or domain layers —
/// always pass [AppLocalizations] into UI-level helpers like this.
class FetchException implements Exception {
  const FetchException(this.code);
  final String code;
}
