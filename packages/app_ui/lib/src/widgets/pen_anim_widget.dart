import 'package:app_ui/src/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@immutable
final class PenAnimWidget extends StatelessWidget {
  const PenAnimWidget({
    super.key,
    this.width,
    this.height,
    this.alignment,
    this.fit,
  });

  final double? width;
  final double? height;
  final Alignment? alignment;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Assets.animations.lotPen,
      package: 'app_ui',
      width: width,
      height: height,
      alignment: alignment,
      fit: fit,
    );
  }
}
