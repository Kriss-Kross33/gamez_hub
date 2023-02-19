/// {@template signup_exception}
///
/// {@endtemplate}
class SignupException implements Exception {
  /// Signup error message.
  final String errorMessage;

  /// {@macro signup_exception}
  const SignupException({required this.errorMessage});
}
