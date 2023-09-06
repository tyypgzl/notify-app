import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/utils/extensions/extensions.dart';

final class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const location = '/login';
  static const name = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(GoRouter.of(context)),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight,
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
        body: const LoginView(),
      ),
    );
  }
}
