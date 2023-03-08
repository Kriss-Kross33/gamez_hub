import 'package:authentication_repository/src/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_model.g.dart';

/// {@template signup_model}
///
/// {@endtemplate}
@JsonSerializable()
class SignupModel extends SignupEntity {
  /// {@macro signup_model}
  const SignupModel({
    required super.email,
    required super.password,
    required super.username,
    required super.firstName,
    required super.lastName,
  });

  ///
  factory SignupModel.fromJson(Map<String, dynamic> json) =>
      _$SignupModelFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$SignupModelToJson(this);
}
