import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        context.l10n.loginTitle,
        style: context.textTheme.displayMedium?.copyWith(
          color: context.colorScheme.onBackground,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
