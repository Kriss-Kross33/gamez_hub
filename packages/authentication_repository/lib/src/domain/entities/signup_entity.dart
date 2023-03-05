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
  });

  /// The user's email address
  final String email;

  /// The user's password
  final String password;

  /// The user's username
  final String username;

  @override
  List<Object> get props => [email, password, username];
}
