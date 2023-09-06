import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/utils/extensions/extensions.dart';
import 'package:notify/utils/padding/padding.dart';

final class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Form(
      key: loginBloc.formKey,
      child: SingleChildScrollView(
        padding: const AppPadding.page(),
        physics: const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            height:
                context.height - context.viewPaddingVertical - kToolbarHeight,
            width: context.width,
          ),
          child: const Column(
            children: [
              Spacer(flex: 4),
              LoginTitle(),
              Spacer(flex: 6),
              EmailTextField(),
              Spacer(flex: 4),
              PasswordTextfield(),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: ForgotPasswordButton(),
              ),
              Spacer(flex: 5),
              LoginButton(),
              SizedBox(height: 12),
              DontHaveAnAccountButton(),
              Spacer(flex: 20),
            ],
          ),
        ),
      ),
    );
  }
}
