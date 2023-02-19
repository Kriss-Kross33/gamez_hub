import 'package:formz/formz.dart';

/// Generic input validation error
enum FieldInputValidationError {
  /// Generic invalid error
  invalid,
}

/// {@template field}
/// Form input for Genric fields
/// {@endtemplate}
class Field extends FormzInput<String, FieldInputValidationError> {
  /// {@macro field}
  const Field.pure() : super.pure('');

  const Field.dirty([String value = '']) : super.dirty(value);

  @override
  FieldInputValidationError? validator(String? value) {
    if (value == null) value = '';
    if (value.isNotEmpty && value.length > 2) return null;
    return FieldInputValidationError.invalid;
  }
}
