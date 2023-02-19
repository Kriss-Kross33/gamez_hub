/// {@template server_exception}
///
/// {@endtemplate}
class ServerException implements Exception {
  /// Server error message.
  final String errorMessage;

  /// {@macro server_exception}
  const ServerException({required this.errorMessage});

  @override
  String toString() => errorMessage;
}
