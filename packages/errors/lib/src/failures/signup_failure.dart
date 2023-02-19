// ignore_for_file: overridden_fields

import 'package:errors/errors.dart';

/// {@template signup_failure}
/// Failure which occurs when [SignupException] is thrown
/// {@endtemplate}
class SignupFailure extends Failure {
  /// {@macro signup_failure}
  const SignupFailure({required this.errorMessage})
      : super(errorMessage: errorMessage);
  @override
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
