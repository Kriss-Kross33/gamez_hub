/// {@template login_exception}
///
/// {@endtemplate}
class LogoutException implements Exception {
  /// Logout error message.
  final String errorMessage;

  /// {@macro login_exception}
  const LogoutException({required this.errorMessage});
}
