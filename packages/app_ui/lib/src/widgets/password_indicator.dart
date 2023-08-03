import 'package:flutter/material.dart';

@immutable
class PasswordIndicator extends StatelessWidget {
  const PasswordIndicator({
    super.key,
    this.length = 5,
    required this.value,
  });

  final int length;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 6,
        child: Row(
          children: List.generate(
            length,
            (index) => Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color:
                      index + 1 > value ? Colors.grey.shade300 : value.getColor,
                ),
                margin: EdgeInsets.only(
                  left: index == 0 ? 0 : 3,
                  right: index == length ? 0 : 3,
                ),
                height: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension on int {
  Color get getColor {
    switch (this) {
      case 1:
        return Colors.red.shade700;
      case 2:
        return Colors.red.shade300;
      case 3:
        return Colors.orangeAccent;
      case 4:
        return Colors.green.shade300;
      case 5:
        return Colors.green.shade700;
      default:
        return Colors.red;
    }
  }
}
