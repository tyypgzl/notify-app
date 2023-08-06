import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/extensions.dart';

enum OnboardButtonType {
  /// The [text] enum type has no background color.
  text,

  /// The [normal] enum type has background color.
  normal;
}

@immutable
final class OnboardButton extends StatelessWidget {
  const OnboardButton({
    super.key,
    required this.onboardButtonType,
    required this.onPressed,
    required this.child,
  });

  final OnboardButtonType onboardButtonType;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: onboardButtonType == OnboardButtonType.text
            ? AdaptiveTextButton(
                onPressed: onPressed,
                backgroundColor: Colors.transparent,
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: context.colorScheme.onBackground,
                  ),
                  child: child,
                ),
              )
            : SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: AdaptiveButton(
                    onPressed: onPressed,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: context.colorScheme.onPrimary,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
