import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/presentation/settings/settings.dart';

@RoutePage()
@immutable
final class SettingsWrapperPage extends AutoRouter {
  const SettingsWrapperPage({super.key});
}

@RoutePage()
@immutable
final class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(
        authRepository: context.read<IAuthRepository>(),
      ),
      child: const SettingsView(),
    );
  }
}
