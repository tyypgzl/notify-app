import 'dart:ui';

import 'package:app_ui/src/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@immutable
final class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AbsorbPointer(
        absorbing: isLoading,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: isLoading
              ? ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: RepaintBoundary(
                      child: Center(
                        child: Lottie.asset(
                          Assets.animations.lotLoading,
                          height: 150,
                          width: 150,
                          package: 'app_ui',
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
