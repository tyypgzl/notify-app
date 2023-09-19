import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/utils/extensions/extensions.dart';

final class FilterSheetWidget extends StatelessWidget {
  const FilterSheetWidget({
    super.key,
    required this.filter,
  });

  final TodoFilter filter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const AppPadding.sheet(),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: TodoFilter.values.length,
        itemBuilder: (context, index) {
          return AdaptiveTile(
            onTap: () {
              context.popRoute(TodoFilter.values.elementAt(index));
            },
            title: Text(
              TodoFilter.values.elementAt(index).name,
              style: context.textTheme.titleLarge,
            ),
            trailing: Radio.adaptive(
              value: TodoFilter.values.elementAt(index),
              onChanged: null,
              groupValue: filter,
            ),
          );
        },
      ),
    );
  }
}
