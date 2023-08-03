import 'package:formz/formz.dart';

/// {@template password_input}
/// Exception thrown if a storage operation fails.
/// {@endtemplate}
class Password extends FormzInput<String, List<PasswordInputError>> {
  /// {@macro password_input}
  const Password.pure([super.value = '']) : super.pure();

  /// {@macro password_input}
  const Password.dirty(super.value) : super.dirty();

  @override
  List<PasswordInputError>? validator(String value) {
    final validErrors = List<PasswordInputError>.empty(growable: true);
    if (value.isEmpty) {
      validErrors.add(PasswordInputError.notEmpty);
    }
    if (value.length < 6) {
      validErrors.add(PasswordInputError.tooShort);
    }
    if (!RegExp('[0-9]').hasMatch(value)) {
      validErrors.add(PasswordInputError.noDigit);
    }
    if (!RegExp('[A-Z]').hasMatch(value)) {
      validErrors.add(PasswordInputError.noUpperCase);
    }
    if (!RegExp('[a-z]').hasMatch(value)) {
      validErrors.add(PasswordInputError.noLowerCase);
    }
    if (!RegExp(r'[!.@#$&*~]').hasMatch(value)) {
      validErrors.add(PasswordInputError.noSpecialCharacter);
    }
    return validErrors.isNotEmpty ? validErrors : null;
  }
}

/// Password Form Input Validation Error
enum PasswordInputError {
  /// Password is empty
  notEmpty,

  /// Password is to short
  tooShort,

  /// Password does not contain any digits
  noDigit,

  /// Password does not contain any upper case
  noUpperCase,

  /// Password does not contain any lower case
  noLowerCase,

  /// Password does not contain any special character [!.@#$&*~]
  noSpecialCharacter,
}
