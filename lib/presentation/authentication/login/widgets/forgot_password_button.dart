import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();

    return AdaptiveTextButton(
      child: Text(
        context.l10n.loginForgotPassword,
        style: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),
        textAlign: TextAlign.end,
      ),
      onPressed: () => loginBloc.add(
        const ForgotPasswordButtonPressed(),
      ),
    );
  }
}
