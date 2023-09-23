import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@immutable
final class AnimationWidget extends StatelessWidget {
  const AnimationWidget({
    required this.asset,
    super.key,
    this.width,
    this.height,
    this.alignment,
    this.fit,
  });

  final String asset;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      asset,
      package: 'app_ui',
      width: width,
      height: height,
      alignment: alignment,
      fit: fit,
    );
  }
}
