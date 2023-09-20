import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class SheetTitle extends StatelessWidget {
  const SheetTitle({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultTextStyle(
            style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ) ??
                const TextStyle(),
            child: child,
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: context.appTheme.dividerColor,
            child: AdaptiveButton(
              padding: const AppPadding.zero(),
              backgroundColor: context.appTheme.dividerColor,
              borderRadius: BorderRadius.circular(50),
              onPressed: () => context.popRoute(),
              child: Icon(
                FontAwesomeIcons.xmark,
                size: 16,
                color: context.colorScheme.onBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
