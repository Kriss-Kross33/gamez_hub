// ignore_for_file: overridden_fields

import 'package:errors/errors.dart';

/// {@template no_internet_failure}
/// Failure which occurs when the app cannot connect to the internet
/// {@endtemplate}
class NoInternetFailure extends Failure {
  /// {@macro no_internet_failure}
  const NoInternetFailure({required this.errorMessage})
      : super(errorMessage: errorMessage);
  @override
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
