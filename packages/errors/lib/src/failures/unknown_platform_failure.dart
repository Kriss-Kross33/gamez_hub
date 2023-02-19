// ignore_for_file: overridden_fields

import 'package:errors/src/errors.dart';

/// {@templaten unknown_platform_failure}
/// Failure which occurs when the platform is unknown
/// {@endtemplate}
class UnknownPlatformFailure extends Failure {
  /// {@macro unknown_platform_failure}
  const UnknownPlatformFailure({required this.errorMessage})
      : super(errorMessage: errorMessage);
  @override
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
