import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class AlreadyHaveAccountButton extends StatelessWidget {
  const AlreadyHaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();

    return AuthClickableTextSpans(
      notClickableText: context.l10n.registerAlreadyHaveAccount,
      clickableText: context.l10n.registerLoginTitle,
      onPressed: () {
        registerBloc.add(
          const AlreadyHaveAnAccountButtonPressed(),
        );
      },
    );
  }
}
