import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

@immutable
final class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    this.title,
    this.titleStyle,
    required this.subTiles,
    this.shrinkWrap = true,
    this.padding,
  });

  final Widget? title;
  final TextStyle? titleStyle;
  final List<SubSettingTile> subTiles;
  final bool shrinkWrap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.all(12),
              child: DefaultTextStyle(
                style: titleStyle ??
                    Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w600,
                        ),
                child: title!,
              ),
            ),
          ListView.builder(
            itemCount: subTiles.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SubSettingTileWidget(
                subSettingTile: subTiles.elementAt(index),
              );
            },
          ),
        ],
      ),
    );
  }
}
