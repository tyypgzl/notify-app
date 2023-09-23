import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String content,
  SnackBarType type = SnackBarType.warning,
  SnackBarAction? action,
  Duration? duration,
  VoidCallback? onVisible,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar(
    reason: SnackBarClosedReason.remove,
  );
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      onVisible: onVisible,
      elevation: 16,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 2,
        ),
      ),
      duration: duration ?? const Duration(seconds: 3),
      content: Row(
        children: [
          Expanded(
            child: Icon(
              type.icon,
              color: type.color,
              size: 30,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 7,
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    letterSpacing: 0,
                  ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      behavior: SnackBarBehavior.floating,
      action: action,
    ),
  );
}
