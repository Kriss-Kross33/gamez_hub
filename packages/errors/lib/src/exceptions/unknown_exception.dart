/// {@template unknown_exception}
///
/// {@endtemplate}
class UnknownException implements Exception {
  /// Unknown error message.
  final String errorMessage;

  /// {@macro unknown_exception}
  const UnknownException({required this.errorMessage});
}
