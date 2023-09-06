import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/presentation/splash/splash.dart';

@immutable
final class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const location = '/';
  static const name = 'splash';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(
        router: GoRouter.of(context),
        authRepository: context.read<IAuthRepository>(),
      ),
      child: const SplashView(),
    );
  }
}
