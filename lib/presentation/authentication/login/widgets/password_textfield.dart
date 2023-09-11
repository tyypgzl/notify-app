import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return AuthTextField.password(
      hintText: '\u2022' * 8,
      controller: loginBloc.passwordController,
      showStrengthIndicator: false,
      labelText: context.l10n.loginPasswordLabel,
      passwordErrorText: context.l10n.passwordValidationMessage,
      textInputAction: TextInputAction.done,
    );
  }
}
