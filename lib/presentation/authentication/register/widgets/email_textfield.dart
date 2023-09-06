import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthTextField.email(
      hintText: context.l10n.registerEmailHint,
      labelText: context.l10n.registerEmailLabel,
      emailErrorText: context.l10n.emailValidationText,
      autoFocus: true,
      textInputAction: TextInputAction.next,
    );
  }
}
