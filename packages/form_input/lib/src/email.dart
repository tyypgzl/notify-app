import 'package:formz/formz.dart';

const String _emailPattern =
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';

/// {@template email_input}
/// Exception thrown if a storage operation fails.
/// {@endtemplate}
class Email extends FormzInput<String, EmailInputError> {
  /// {@macro email_input}
  const Email.pure([super.value = '']) : super.pure();

  /// {@macro email_input}
  const Email.dirty(super.value) : super.dirty();

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) {
      return EmailInputError.notEmpty;
    } else if (!RegExp(_emailPattern).hasMatch(value)) {
      return EmailInputError.notValid;
    } else {
      return null;
    }
  }
}

/// Email Form Input Validation Error
enum EmailInputError {
  /// Email is invalid
  notValid,

  /// Email is empty
  notEmpty,
}
