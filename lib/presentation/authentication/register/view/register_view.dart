import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/core/padding/padding.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.background,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: AdaptiveIconButton(
          icon: Icons.arrow_back_ios_new,
          color: context.colorScheme.onBackground,
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
      ),
      body: Form(
        key: registerBloc.formKey,
        child: SingleChildScrollView(
          padding: const AppPadding.page(),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(
              height:
                  context.height - context.viewPaddingVertical - kToolbarHeight,
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
      ),
    );
  }
}
