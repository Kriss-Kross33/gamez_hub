import 'package:equatable/equatable.dart';

/// {@template failure}
/// Represents an error which occurs in the app.
/// {@endtemplate}
abstract class Failure extends Equatable {
  /// {macro failure}
  const Failure({required this.errorMessage});

  /// Error message to display to user.
  final String errorMessage;
}
