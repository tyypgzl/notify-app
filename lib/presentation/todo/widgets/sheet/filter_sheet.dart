import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/utils/extensions/extensions.dart';

final class FilterSheetWidget extends StatefulWidget {
  const FilterSheetWidget({
    super.key,
    required this.filter,
  });

  final TodoFilter filter;

  @override
  State<FilterSheetWidget> createState() => _FilterSheetWidgetState();
}

class _FilterSheetWidgetState extends State<FilterSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: AdaptiveIconButton(
              icon: Icons.close,
              size: 32,
              onPressed: () async {
                await context.router.pop();
              },
              color: context.colorScheme.onBackground,
            ),
          ),
          ListView.separated(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: TodoFilter.values.length,
            itemBuilder: (context, index) {
              return RadioListTile(
                title: Text(
                  TodoFilter.values.elementAt(index).name,
                ),
                value: TodoFilter.values.elementAt(index),
                onChanged: null,
                groupValue: widget.filter,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: context.colorScheme.onBackground,
              );
            },
          ),
        ],
      ),
    );
  }
}
