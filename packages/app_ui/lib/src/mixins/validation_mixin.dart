mixin ValidationMixin {
  String? emailValidator(String? email, String errorMessage) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    return email != null && email.isNotEmpty && regExp.hasMatch(email)
        ? null
        : errorMessage;
  }

  String? passwordValidator(String? password, String errorMessage) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.-_]).{8,}$';

    final regExp = RegExp(pattern);
    return password != null && password.isNotEmpty && regExp.hasMatch(password)
        ? null
        : errorMessage;
  }

  int passwordValidateValue(String? password) {
    const upperCasePattern = '[A-Z]';
    const lowerCasePattern = '[a-z]';
    const digitPattern = '[0-9]';
    const specialCharacterPattern = r'(?=.*[@$!%*#?&.-])';

    final upperCaseRegExp = RegExp(upperCasePattern);
    final lowerCaseRegExp = RegExp(lowerCasePattern);
    final digitRegExp = RegExp(digitPattern);
    final specialCharacterRegExp = RegExp(specialCharacterPattern);

    var value = 0;

    if (password == null || password.isEmpty || password.length < 6) {
      value = 0;
    } else {
      if (password.length > 6) {
        value++;
      }
      if (upperCaseRegExp.hasMatch(password)) {
        value++;
      }
      if (lowerCaseRegExp.hasMatch(password)) {
        value++;
      }
      if (digitRegExp.hasMatch(password)) {
        value++;
      }
      if (specialCharacterRegExp.hasMatch(password)) {
        value++;
      }
    }

    return value;
  }
}
