import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: duration ?? const Duration(seconds: 3),
      content: Row(
        children: [
          Expanded(
            child: IconTheme(
              data: IconThemeData(
                color: type.color,
                size: 32,
              ),
              child: Icon(
                type.icon,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 7,
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w500,
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

enum SnackBarType {
  warning,
  info,
  error,
  success;

  Color get color {
    switch (this) {
      case SnackBarType.warning:
        return Colors.amber;
      case SnackBarType.info:
        return Colors.blueAccent;
      case SnackBarType.error:
        return Colors.redAccent;
      case SnackBarType.success:
        return Colors.green;
    }
  }

  IconData get icon {
    switch (this) {
      case SnackBarType.warning:
        return FontAwesomeIcons.triangleExclamation;
      case SnackBarType.info:
        return FontAwesomeIcons.circleInfo;
      case SnackBarType.error:
        return FontAwesomeIcons.circleExclamation;
      case SnackBarType.success:
        return FontAwesomeIcons.solidCircleCheck;
    }
  }
}
