import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();

    return AuthButton.text(
      title: context.l10n.loginTitle,
      onPressed: () => loginBloc.add(
        const LoginButtonPressed(),
      ),
    );
  }
}
