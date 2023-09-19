import 'package:flutter/material.dart';

@immutable
final class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.message,
    this.stackTrace,
  });

  final String message;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
