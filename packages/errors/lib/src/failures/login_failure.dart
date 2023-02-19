// ignore_for_file: overridden_fields

import 'package:errors/src/errors.dart';

/// {@template login_failure}
/// Failure which occurs when [LoginException] is thrown
/// {@endtemplate}
class LoginFailure extends Failure {
  /// {@macro login_failure}
  const LoginFailure({required this.errorMessage})
      : super(errorMessage: errorMessage);
  @override
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
