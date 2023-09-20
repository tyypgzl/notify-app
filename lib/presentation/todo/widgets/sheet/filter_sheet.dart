import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/presentation/todo/todo.dart';
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
      padding: const AppPadding.sheet().add(
        const AppPadding.x16(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SheetTitle(
            child: Text('Filter'),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: TodoFilter.values.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const AppPadding.zero(),
                splashColor: Colors.transparent,
                onTap: () {
                  context.popRoute(TodoFilter.values.elementAt(index));
                },
                title: Text(
                  TodoFilter.values.elementAt(index).name,
                  style: context.textTheme.bodyLarge,
                ),
                trailing: Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: TodoFilter.values.elementAt(index),
                  onChanged: (value) {},
                  groupValue: filter,
                  activeColor: context.colorScheme.primary,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
