import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();
    return Form(
      key: registerBloc.formKey,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            height: context.height,
            width: context.width,
          ),
          child: const Column(
            children: [
              Spacer(flex: 2),
              RegisterTitle(),
              Spacer(flex: 3),
              EmailTextField(),
              Spacer(flex: 2),
              PasswordTextField(),
              Spacer(flex: 3),
              RegisterButton(),
              Spacer(),
              AlreadyHaveAccountButton(),
              Spacer(flex: 7),
            ],
          ),
        ),
      ),
    );
  }
}
