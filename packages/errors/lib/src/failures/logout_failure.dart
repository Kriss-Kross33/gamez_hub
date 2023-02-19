// ignore_for_file: overridden_fields

import 'package:errors/errors.dart';

/// {@template logout_failure}
/// Failure which occurs when [LogoutException] is thrown
/// {@endtemplate}
class LogoutFailure extends Failure {
  /// {@macro logout_failure}
  const LogoutFailure({required this.errorMessage})
      : super(errorMessage: errorMessage);
  @override
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
