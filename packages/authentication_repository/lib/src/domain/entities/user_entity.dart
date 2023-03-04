import 'package:equatable/equatable.dart';

/// {@template user_entity}
/// User Entity
///
/// [UserEntity.empty] represents an unauthenticated user.
/// {@endtemplate}
class UserEntity extends Equatable {
  /// {@macro user_entity}
  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
  });

  /// The id of the user.
  final String id;

  /// The user's email address
  final String email;

  /// The user's username
  final String username;

  static UserEntity empty = const UserEntity(
    id: '',
    email: '',
    username: '',
  );

  @override
  List<Object?> get props => [
        id,
        email,
        username,
      ];
}
