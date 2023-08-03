import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/register/register.dart';

@RoutePage()
@immutable
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const name = '/register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: const RegisterView(),
    );
  }
}
