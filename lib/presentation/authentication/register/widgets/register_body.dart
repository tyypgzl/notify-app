import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();
    return Form(
      key: registerBloc.formKey,
      child: SingleChildScrollView(
        physics: const RangeMaintainingScrollPhysics(),
        child: SizedBox(
          width: context.width,
          height: context.height -
              (context.mediaQuery.padding.vertical + 24 + kToolbarHeight),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                child: Text(
                  context.l10n.registerTitle,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: context.colorScheme.onBackground,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const Spacer(flex: 3),
              AuthTextField.email(
                hintText: context.l10n.registerEmailHint,
                labelText: context.l10n.registerEmailLabel,
                emailErrorText: context.l10n.emailValidationText,
                autoFocus: true,
                textInputAction: TextInputAction.next,
              ),
              const Spacer(flex: 2),
              AuthTextField.password(
                hintText: '\u2022' * 8,
                textInputAction: TextInputAction.next,
                labelText: context.l10n.registerPasswordLabel,
                passwordErrorText: context.l10n.passwordValidationMessage,
              ),
              const Spacer(flex: 3),
              AuthButton.text(
                title: context.l10n.registerTitle,
                onPressed: () {
                  registerBloc.add(const RegisterButtonPressed());
                },
              ),
              const Spacer(),
              AuthClickableTextSpans(
                notClickableText: context.l10n.registerAlreadyHaveAccount,
                clickableText: context.l10n.registerLoginTitle,
                onPressed: () {
                  registerBloc.add(
                    const AlreadyHaveAnAccountButtonPressed(),
                  );
                },
              ),
              const Spacer(flex: 7),
            ],
          ),
        ),
      ),
    );
  }
}
