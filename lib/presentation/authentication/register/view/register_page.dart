import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/presentation/authentication/register/register.dart';

@RoutePage()
@immutable
final class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(
        authRepository: context.read<IAuthRepository>(),
      ),
      child: const RegisterView(),
    );
  }
}
