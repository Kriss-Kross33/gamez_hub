import 'package:formz/formz.dart';

/// Validator error for [ConfirmPassword][FormzInput]
enum ConfirmPasswordValidationError {
  /// Generic invalid error
  invalid
}

/// {@template confirm_password}
/// Form input for confirm password input
/// {@endtemplate}
class ConfirmPassword
    extends FormzInput<String, ConfirmPasswordValidationError> {
  /// The original password entered.
  final String password;

  /// {@macro confirm_password}
  const ConfirmPassword.pure({this.password = ''}) : super.pure('');

  /// {@macro confirm_password}
  const ConfirmPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  @override
  ConfirmPasswordValidationError? validator(String? value) {
    return password == value ? null : ConfirmPasswordValidationError.invalid;
  }
}
