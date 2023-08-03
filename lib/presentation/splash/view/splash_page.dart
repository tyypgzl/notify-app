import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/splash/splash.dart';

@RoutePage()
@immutable
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const name = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: const SplashView(),
    );
  }
}
