import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) =>
          previous.snackBarInfo != current.snackBarInfo,
      listener: (context, state) {
        if (state.snackBarInfo.showSnackBar) {
          showSnackBar(
            context: context,
            content: state.snackBarInfo.message ?? '',
            type: state.snackBarInfo.type,
          );
          registerBloc.add(ResetRegisterSnackBar());
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: context.colorScheme.background,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              leading: AdaptiveIconButton(
                icon: Icons.arrow_back_ios_new,
                color: context.colorScheme.onBackground,
                onPressed: () =>
                    registerBloc.add(const RegisterBackButtonPressed()),
              ),
            ),
            body: Form(
              key: registerBloc.formKey,
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
          ),
          BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) => Positioned.fill(
              child: LoadingWidget(
                isLoading: state.isLoading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
