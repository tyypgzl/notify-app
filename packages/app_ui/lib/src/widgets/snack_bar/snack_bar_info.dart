import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

@immutable
final class SnackBarInfo {
  const SnackBarInfo({
    this.message,
    required this.type,
    required this.showSnackBar,
  });

  const SnackBarInfo.init()
      : this(type: SnackBarType.info, showSnackBar: false);

  final String? message;
  final SnackBarType type;
  final bool showSnackBar;

  SnackBarInfo copyWith({
    String? message,
    SnackBarType? type,
    bool? showSnackBar,
  }) {
    return SnackBarInfo(
      message: message ?? this.message,
      type: type ?? this.type,
      showSnackBar: showSnackBar ?? this.showSnackBar,
    );
  }

  @override
  bool operator ==(covariant SnackBarInfo other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.type == type &&
        other.showSnackBar == showSnackBar;
  }

  @override
  int get hashCode => message.hashCode ^ type.hashCode ^ showSnackBar.hashCode;
}
