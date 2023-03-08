import 'package:equatable/equatable.dart';

/// {@template signup_entity}
/// Class that represents signup data.
/// {@endtemplate}
class SignupEntity extends Equatable {
  /// {@macro signup_entity}
  const SignupEntity({
    required this.email,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  /// The user's first name
  final String firstName;

  /// The user's last name
  final String lastName;

  /// The user's email address
  final String email;

  /// The user's password
  final String password;

  /// The user's username
  final String username;

  @override
  List<Object> get props => [
        email,
        password,
        username,
        firstName,
        lastName,
      ];
}
