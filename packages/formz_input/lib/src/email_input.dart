import 'package:formz/formz.dart';

/// Validation error for the [Email][FormzInput]
enum EmailValidatorError {
  /// Generic invalid error
  invalid;
}

/// {@template email}
/// Form input for an email input
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidatorError> {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  @override
  EmailValidatorError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidatorError.invalid;
  }
}
