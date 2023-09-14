import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();
    return AuthTextField.password(
      hintText: '\u2022' * 8,
      controller: registerBloc.passwordController,
      textInputAction: TextInputAction.done,
      labelText: context.l10n.registerPasswordLabel,
      passwordErrorText: context.l10n.passwordValidationMessage,
    );
  }
}
