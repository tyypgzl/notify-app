import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthTextField.password(
      hintText: '\u2022' * 8,
      showStrengthIndicator: false,
      labelText: context.l10n.loginPasswordLabel,
      passwordErrorText: context.l10n.passwordValidationMessage,
      textInputAction: TextInputAction.done,
    );
  }
}
