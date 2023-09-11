import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/presentation/onboard/onboard.dart';

final class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardCubit(
        router: GoRouter.of(context),
        authRepository: context.read<IAuthRepository>(),
      ),
      child: const Scaffold(
        body: OnboardView(),
      ),
    );
  }
}
