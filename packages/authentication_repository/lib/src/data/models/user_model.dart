import 'package:authentication_repository/src/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

/// {@template user_model}
/// User model
/// {@endtemplate}
@JsonSerializable()
class UserModel extends UserEntity {
  /// {@macro user_model}
  const UserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.gender,
    required super.password,
  });

  /// Converts data from server to [UserModel]
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Converts [UserModel] to [Map]
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
