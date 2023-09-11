import 'package:equatable/equatable.dart';
import 'package:notify/presentation/widgets/widgets.dart';

class SnackBarInfo with EquatableMixin {
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

  @override
  List<Object?> get props => [
        message,
        type,
        showSnackBar,
      ];

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
}
