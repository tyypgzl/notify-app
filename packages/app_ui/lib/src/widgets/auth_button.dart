import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton.text({
    super.key,
    required String title,
    required this.onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
  })  : _title = title,
        _backgroundColor = backgroundColor,
        _foregroundColor = foregroundColor;

  final String _title;
  final Color? _backgroundColor;
  final Color? _foregroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: MediaQuery.maybeOf(context)?.size.width,
      child: AdaptiveButton(
        onPressed: onPressed,
        backgroundColor: _backgroundColor,
        child: Text(
          _title,
          style: TextStyle(
            color: _foregroundColor,
          ),
        ),
      ),
    );
  }
}
