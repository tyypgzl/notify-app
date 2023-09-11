import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/core/padding/padding.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/presentation/widgets/widgets.dart';
import 'package:notify/utils/extensions/extensions.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.snackBarInfo != current.snackBarInfo,
      listener: (context, loginState) {
        if (loginState.snackBarInfo.showSnackBar) {
          showSnackBar(
            context: context,
            content: loginState.snackBarInfo.message ?? '',
            type: loginState.snackBarInfo.type,
          );
          loginBloc.add(ResetLoginSnackBar());
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: kToolbarHeight,
            backgroundColor: context.colorScheme.background,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            leading: AdaptiveIconButton(
              icon: Icons.arrow_back_ios_new,
              color: context.colorScheme.onBackground,
              onPressed: () => loginBloc.add(LoginBackButtonPressed()),
            ),
          ),
          body: LoadingWidget(
            isLoading: state.isLoading,
            child: Form(
              key: loginBloc.formKey,
              child: SingleChildScrollView(
                padding: const AppPadding.page(),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(
                    height: context.height -
                        context.viewPaddingVertical -
                        kToolbarHeight,
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
            ),
          ),
        );
      },
    );
  }
}
