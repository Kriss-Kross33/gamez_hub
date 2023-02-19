/// {@template login_exception}
///
/// {@endtemplate}
class LoginException implements Exception {
  /// Login error message.
  final String errorMessage;

  /// {@macro login_exception}
  const LoginException({required this.errorMessage});
}
