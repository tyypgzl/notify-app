import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class DontHaveAnAccountButton extends StatelessWidget {
  const DontHaveAnAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();

    return AuthClickableTextSpans(
      notClickableText: context.l10n.loginDontHaveAccount,
      clickableText: context.l10n.loginRegisterTitle,
      onPressed: () => loginBloc.add(
        const DontHaveAnAccountButtonPressed(),
      ),
    );
  }
}
