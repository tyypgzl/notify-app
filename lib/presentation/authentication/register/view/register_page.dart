import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const location = '/register';
  static const name = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(GoRouter.of(context)),
      child: Scaffold(
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
        body: const RegisterView().pagePadding,
      ),
    );
  }
}
