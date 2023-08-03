import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({
    super.key,
    required this.text,
  });

  final Text text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 10),
            child: const Divider(
              thickness: 3,
            ),
          ),
        ),
        text,
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 10),
            child: const Divider(
              thickness: 3,
            ),
          ),
        ),
      ],
    );
  }
}
