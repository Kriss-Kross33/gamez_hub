import 'package:formz/formz.dart';

/// Validation error for the [Password][FormzInput]
enum PasswordValidationError {
  /// Generic invalid error
  invalid
}

/// {template password}
/// Form input for a password input
/// {@endtemplate}
class Password extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([String value = '']) : super.dirty(value);

  static final RegExp _passwordRegExp =
      RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$');

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegExp.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.invalid;
  }
}
