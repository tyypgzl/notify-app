import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/presentation/todo/todo.dart';
import 'package:notify/utils/extensions/context_extension.dart';

import 'package:uuid/uuid.dart';

@immutable
final class AddTodoWidgetSheet extends StatefulWidget {
  const AddTodoWidgetSheet({super.key});

  @override
  State<AddTodoWidgetSheet> createState() => _AddTodoWidgetSheetState();
}

final class _AddTodoWidgetSheetState extends State<AddTodoWidgetSheet>
    with TodoValidationMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom +
            MediaQuery.paddingOf(context).bottom,
      ).add(const AppPadding.sheet()).add(
            const AppPadding.x12(),
          ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetTitle(
              child: Text(l10n.addTodoSheetTitle),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const AppPadding.y16(),
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => emptyValid(
                  value: value,
                  errorMessage: l10n.addTodoSheetFieldErrorMessage,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(FontAwesomeIcons.check),
                  hintText: l10n.addTodoSheetFieldHintText,
                ),
                controller: todoController,
              ),
            ),
            Padding(
              padding: const AppPadding.y16(),
              child: TextField(
                decoration: InputDecoration(
                  hintText: l10n.addTodoSheetDescFieldHintText,
                  prefixIcon: const Icon(FontAwesomeIcons.tag),
                ),
                controller: descController,
                onEditingComplete: () {
                  if (formKey.currentState?.validate() ?? false) {
                    final todo = TodoModel(
                      title: todoController.text,
                      colorNumber: Colors.primaries.indexOf(
                        _selectedColor ?? Colors.grey,
                      ),
                      description: descController.text,
                      activity: TodoActivity.waiting,
                      id: const Uuid().v1(),
                      createdTime: DateTime.now(),
                    );
                    context.popRoute(todo);
                  }
                },
              ),
            ),
            SizedBox(
              height: 44,
              child: ListView(
                padding: const EdgeInsets.only(top: 8),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  Colors.primaries.length,
                  (index) => InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      setState(() {
                        _selectedColor = Colors.primaries.elementAt(index);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedColor ==
                                  Colors.primaries.elementAt(index)
                              ? Colors.primaries.elementAt(
                                  index,
                                )
                              : Colors.white,
                          border: Border.all(
                            width: 7,
                            color: Colors.primaries.elementAt(index),
                          ),
                          shape: BoxShape.circle,
                        ),
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin TodoValidationMixin on State<AddTodoWidgetSheet> {
  late final TextEditingController todoController;
  late final TextEditingController descController;
  late final GlobalKey<FormState> formKey;

  MaterialColor? _selectedColor;

  @override
  void initState() {
    super.initState();
    todoController = TextEditingController();
    descController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    todoController.dispose();
    descController.dispose();
  }

  String? emptyValid({
    String? value,
    required String errorMessage,
  }) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
