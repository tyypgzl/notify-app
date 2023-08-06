import 'package:flutter/material.dart';
import 'package:notify/presentation/onboard/model/onboard_model.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class OnboardBody extends StatelessWidget {
  const OnboardBody({
    super.key,
    required this.onboardModel,
  });

  final OnboardModel onboardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          onboardModel.assetsPath,
          width: context.width,
          height: context.height / 2,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              onboardModel.title,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.onBackground,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          child: Text(
            onboardModel.content,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.colorScheme.onBackground.withOpacity(.9),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
