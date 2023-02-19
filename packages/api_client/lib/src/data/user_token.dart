import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_token.g.dart';

/// {@template UserToken}
/// UserToken model to store user token
/// {@endTemplate}
@JsonSerializable()
class UserToken extends Equatable {
  /// {@macro}
  const UserToken({
    required this.token,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  /// Factory which converts a [Map<String, dynamic>] into a [UserToken].
  factory UserToken.fromJson(Map<String, dynamic> json) =>
      _$UserTokenFromJson(json);

  /// Converts the current [UserToken] into a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$UserTokenToJson(this);

  /// FCM token
  final String token;

  /// The timestamp at which token was deleted
  final DateTime? deletedAt;

  /// The timestamp at which token was created
  final DateTime? createdAt;

  /// The timestamp at which token was updated
  final DateTime? updatedAt;

  /// CopyWith constructor to update model
  UserToken copyWith({
    String? token,
    DateTime? deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserToken(
      token: token ?? this.token,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        token,
        deletedAt,
        createdAt,
        updatedAt,
      ];
}
