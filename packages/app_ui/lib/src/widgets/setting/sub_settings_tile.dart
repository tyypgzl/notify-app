import 'package:app_ui/src/padding/padding.dart';
import 'package:flutter/material.dart';

@immutable
final class SubSettingTileWidget extends StatelessWidget {
  const SubSettingTileWidget({
    super.key,
    required this.subSettingTile,
  });

  final SubSettingTile subSettingTile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: subSettingTile.onTap,
          splashFactory: NoSplash.splashFactory,
          child: Padding(
            padding: const AppPadding.all8().add(
              subSettingTile.padding ?? const AppPadding.zero(),
            ),
            child: Row(
              children: [
                if (subSettingTile.leading != null)
                  Expanded(
                    flex: 3,
                    child: IconTheme(
                      data: subSettingTile.leadingIconThemeData ??
                          IconThemeData(
                            size: 24,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                      child: subSettingTile.leading!,
                    ),
                  ),
                const Spacer(),
                Expanded(
                  flex: 18,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subSettingTile.title,
                        style: subSettingTile.titleStyle ??
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  letterSpacing: 0,
                                ),
                      ),
                      if (subSettingTile.subtitle != null)
                        Text(
                          subSettingTile.subtitle!,
                          style: subSettingTile.subTitleStyle ??
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(.5),
                                  ),
                        ),
                    ],
                  ),
                ),
                if (subSettingTile.isShowNavigationArrow)
                  const Expanded(
                    flex: 3,
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (subSettingTile.showBottomDivider)
          Divider(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.6),
            thickness: .3,
            height: 2,
          ),
      ],
    );
  }
}

final class SubSettingTile {
  const SubSettingTile({
    required this.title,
    this.subtitle,
    this.leading,
    this.isShowNavigationArrow = true,
    this.onTap,
    this.leadingIconThemeData,
    this.titleStyle,
    this.subTitleStyle,
    this.showBottomDivider = true,
    this.padding,
  });

  final String title;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final String? subtitle;
  final Icon? leading;
  final IconThemeData? leadingIconThemeData;
  final bool isShowNavigationArrow;
  final VoidCallback? onTap;
  final bool showBottomDivider;
  final EdgeInsets? padding;
}
