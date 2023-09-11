import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/presentation/authentication/login/login.dart';

@RoutePage()
@immutable
final class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepository: context.read<IAuthRepository>(),
      ),
      child: const LoginView(),
    );
  }
}
