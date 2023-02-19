// ignore_for_file: overridden_fields

import 'package:errors/src/errors.dart';

/// {@template forced_update_failure}
/// Failure which occurs when there is a failure in trying
/// to make the user force update the app.
/// {@endtemplate}
class ForcedUpdateFailure extends Failure {
  /// {@macro forced_update_failure}
  const ForcedUpdateFailure({required this.errorMessage})
      : super(errorMessage: errorMessage);
  @override
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
