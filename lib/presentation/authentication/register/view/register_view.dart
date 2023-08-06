import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notify/presentation/authentication/register/widgets/register_body.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.background,
        leading: AdaptiveIconButton(
          icon: Icons.arrow_back_ios_new,
          color: context.colorScheme.onBackground,
          onPressed: () {
            context.router.back();
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: RegisterBody(),
      ),
    );
  }
}
