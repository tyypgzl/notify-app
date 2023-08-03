import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthClickableTextSpans extends StatelessWidget {
  const AuthClickableTextSpans({
    super.key,
    required this.notClickableText,
    required this.clickableText,
    required this.onPressed,
  });

  final String notClickableText;
  final String clickableText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        children: [
          TextSpan(text: notClickableText),
          TextSpan(
            text: clickableText,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}
