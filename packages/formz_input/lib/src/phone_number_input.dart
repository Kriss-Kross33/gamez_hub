import 'package:formz/formz.dart';

/// Validation error for [Phone][FormzInput]
enum PhoneNumberValidationError {
  /// Generic invalid error
  invalid,
}

/// {@template phone}
/// Formz input for phone input.
/// {@endtemplate}
class Phone extends FormzInput<String, PhoneNumberValidationError> {
  /// {@macro phone}
  const Phone.pure() : super.pure('');

  /// {@macro phone}
  const Phone.dirty([String value = '']) : super.dirty(value);
  @override
  PhoneNumberValidationError? validator(String? value) {
    if (value == null) value = '';
    if (value.length >= 9 && value.length <= 11) {
      return null;
    } else {
      return PhoneNumberValidationError.invalid;
    }
  }
}
