import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();

    return AuthButton.text(
      title: context.l10n.registerTitle,
      onPressed: () {
        registerBloc.add(const RegisterButtonPressed());
      },
    );
  }
}
