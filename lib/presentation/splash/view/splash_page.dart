import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/presentation/splash/splash.dart';

@RoutePage()
@immutable
final class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(
        authRepository: context.read<IAuthRepository>(),
      ),
      child: const SplashView(),
    );
  }
}
