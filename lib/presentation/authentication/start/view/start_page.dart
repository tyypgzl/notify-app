import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/authentication/start/start.dart';

@RoutePage()
@immutable
final class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StartCubit>(
      create: (context) => StartCubit(),
      child: const StartView(),
    );
  }
}
