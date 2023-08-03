import 'package:formz/formz.dart';

const String _phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

/// {@template phone_input}
/// Exception thrown if a storage operation fails.
/// {@endtemplate}
class Phone extends FormzInput<String, PhoneInputError> {
  /// {@macro phone_input}
  const Phone.pure([super.value = '']) : super.pure();

  /// {@macro phone_input}
  const Phone.dirty([super.value = '']) : super.dirty();

  @override
  PhoneInputError? validator(String value) {
    if (value.isEmpty) {
      return PhoneInputError.notEmpty;
    } else if (!RegExp(_phonePattern).hasMatch(value)) {
      return PhoneInputError.notValid;
    } else {
      return null;
    }
  }
}

/// Phone Form Input Validation Error
enum PhoneInputError {
  /// Phone is invalid
  notValid,

  /// Phone is empty
  notEmpty,
}
