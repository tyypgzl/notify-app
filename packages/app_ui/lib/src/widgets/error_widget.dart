import 'package:flutter/material.dart';

@immutable
class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
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
