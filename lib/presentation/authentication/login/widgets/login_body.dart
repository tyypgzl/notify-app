import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/utils/extensions/extensions.dart';

final class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Form(
      key: loginBloc.formKey,
      child: SingleChildScrollView(
        physics: const RangeMaintainingScrollPhysics(),
        child: SizedBox(
          width: context.width,
          height: context.height -
              (context.mediaQuery.padding.vertical + 24 + kToolbarHeight),
          child: Column(
            children: [
              const Spacer(flex: 4),
              SizedBox(
                width: double.infinity,
                child: Text(
                  context.l10n.loginTitle,
                  style: context.textTheme.displayMedium?.copyWith(
                    color: context.colorScheme.onBackground,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const Spacer(flex: 6),
              AuthTextField.email(
                hintText: context.l10n.loginEmailHint,
                labelText: context.l10n.loginEmailLabel,
                autoFocus: true,
                textInputAction: TextInputAction.next,
                emailErrorText: context.l10n.emailValidationText,
              ),
              const Spacer(flex: 4),
              AuthTextField.password(
                hintText: '\u2022' * 8,
                showStrengthIndicator: false,
                labelText: context.l10n.loginPasswordLabel,
                passwordErrorText: context.l10n.passwordValidationMessage,
                textInputAction: TextInputAction.done,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: AdaptiveTextButton(
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
                ),
              ),
              const Spacer(),
              AuthButton.text(
                title: context.l10n.loginTitle,
                onPressed: () => loginBloc.add(
                  const LoginButtonPressed(),
                ),
              ),
              const Spacer(flex: 2),
              AuthClickableTextSpans(
                notClickableText: context.l10n.loginDontHaveAccount,
                clickableText: context.l10n.loginRegisterTitle,
                onPressed: () => loginBloc.add(
                  const DontHaveAnAccountButtonPressed(),
                ),
              ),
              const Spacer(flex: 14),
            ],
          ),
        ),
      ),
    );
  }
}
