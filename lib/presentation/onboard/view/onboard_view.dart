import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/config/generated/assets.gen.dart';
import 'package:notify/presentation/onboard/onboard.dart';
import 'package:notify/utils/extensions/extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@immutable
final class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            PageView.builder(
              controller: context.read<OnboardCubit>().pageController,
              itemCount: context.getOnboardDatas.length,
              onPageChanged: context.read<OnboardCubit>().onPageChanged,
              itemBuilder: (context, index) {
                return OnboardBody(
                  onboardModel: context.getOnboardDatas.elementAt(index),
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: OnboardButton(
                onboardButtonType: OnboardButtonType.text,
                onPressed: context.read<OnboardCubit>().skipButtonPressed,
                child: Text(context.l10n.onboardSkip),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: OnboardButton(
                onboardButtonType: OnboardButtonType.text,
                onPressed: context.read<OnboardCubit>().backButtonPressed,
                child: Text(context.l10n.onboardBack),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: OnboardButton(
                onboardButtonType: OnboardButtonType.normal,
                onPressed: context.read<OnboardCubit>().nextButtonPressed,
                child: BlocBuilder<OnboardCubit, int>(
                  builder: (context, state) {
                    return Text(
                      state == 2
                          ? context.l10n.onboardGetStarted
                          : context.l10n.onboardNext,
                    );
                  },
                ),
              ),
            ),
            Align(
              child: SmoothPageIndicator(
                controller: context.read<OnboardCubit>().pageController,
                effect: WormEffect(
                  activeDotColor: context.colorScheme.primary,
                  dotColor: context.appTheme.disabledColor,
                  dotWidth: 14,
                  dotHeight: 14,
                ),
                count: context.getOnboardDatas.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Get [OnboardModel] data list extension.
extension _OnboardX on BuildContext {
  List<OnboardModel> get getOnboardDatas {
    return [
      OnboardModel(
        assetsPath: Assets.images.imgOnboardFirst.path,
        title: l10n.onboardFirstTitle,
        content: l10n.onboardFirstContent,
      ),
      OnboardModel(
        assetsPath: Assets.images.imgOnboardSecond.path,
        title: l10n.onboardSecondTitle,
        content: l10n.onboardSecondContent,
      ),
      OnboardModel(
        assetsPath: Assets.images.imgOnboardThird.path,
        title: l10n.onboardThirdTitle,
        content: l10n.onboardThirdContent,
      ),
    ];
  }
}
