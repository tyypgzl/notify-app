import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class StartPage extends StatelessWidget {
  const StartPage({super.key});

  static const location = '/start';
  static const name = 'start';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        toolbarOpacity: 0,
      ),
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
                  context.push(LoginPage.location);
                },
              ),
              const Spacer(),
              AuthButton.text(
                backgroundColor: context.colorScheme.tertiaryContainer,
                title: context.l10n.startCreateAccount,
                foregroundColor: context.colorScheme.onTertiaryContainer,
                onPressed: () {
                  context.push(RegisterPage.location);
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
