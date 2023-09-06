import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthTextField.password(
      hintText: '\u2022' * 8,
      textInputAction: TextInputAction.done,
      labelText: context.l10n.registerPasswordLabel,
      passwordErrorText: context.l10n.passwordValidationMessage,
    );
  }
}
