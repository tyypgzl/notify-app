import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.child,
    required this.isLoading,
    required this.loadingWidget,
  });

  final Widget child;
  final bool isLoading;
  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        Positioned.fill(
          child: AbsorbPointer(
            absorbing: isLoading,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: isLoading
                  ? ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: RepaintBoundary(
                    child: loadingWidget,
                  ),
                ),
              )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}
