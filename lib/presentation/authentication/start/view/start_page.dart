import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notify/config/router/app_router.dart';
import 'package:notify/utils/extensions/extensions.dart';

@RoutePage()
@immutable
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  static const name = '/start';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Spacer(
                flex: 6,
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  context.l10n.startTitle,
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: context.colorScheme.onBackground,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                context.l10n.startContent,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onBackground,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 24),
              AuthButton.text(
                title: context.l10n.startLogin,
                onPressed: () {
                  context.navigateTo(const LoginRoute());
                },
              ),
              const Spacer(),
              AuthButton.text(
                backgroundColor: context.colorScheme.tertiaryContainer,
                title: context.l10n.startCreateAccount,
                foregroundColor: context.colorScheme.onTertiaryContainer,
                onPressed: () {
                  context.navigateTo(const RegisterRoute());
                },
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
