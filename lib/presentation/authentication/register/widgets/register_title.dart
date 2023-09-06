import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class RegisterTitle extends StatelessWidget {
  const RegisterTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        context.l10n.registerTitle,
        style: context.textTheme.displaySmall?.copyWith(
          color: context.colorScheme.onBackground,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
