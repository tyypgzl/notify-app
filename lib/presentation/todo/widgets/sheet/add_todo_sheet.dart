import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/utils/extensions/extensions.dart';

import 'package:uuid/uuid.dart';

@immutable
class AddTodoWidgetSheet extends StatefulWidget {
  const AddTodoWidgetSheet({
    super.key,
    required this.formKey,
    required this.onCompleted,
  });

  final GlobalKey<FormState> formKey;
  final void Function(TodoModel? todo) onCompleted;

  @override
  State<AddTodoWidgetSheet> createState() => _AddTodoWidgetSheetState();
}

class _AddTodoWidgetSheetState extends State<AddTodoWidgetSheet>
    with TodoValidationMixin {
  late final TextEditingController todoController;
  late final TextEditingController tagsController;
  late final FocusNode todoFocusNode;
  late final FocusNode tagsFocusNode;

  TodoPriority? _selectedTodo;
  MaterialColor? _selectedColor;
  TodoModel? _todo;

  @override
  void initState() {
    super.initState();
    todoController = TextEditingController();
    tagsController = TextEditingController();
    todoFocusNode = FocusNode();
    tagsFocusNode = FocusNode();
    tagsFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    todoController.dispose();
    tagsController.dispose();
    todoFocusNode.dispose();
    tagsFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.viewPaddingBottom,
      ).add(
        const EdgeInsets.all(
          16,
        ),
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                autofocus: true,
                focusNode: todoFocusNode,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => emptyValid(
                  value: value,
                  errorMessage: 'Please enter some text',
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(FontAwesomeIcons.check),
                  hintText: 'e.g., Read the Atomic habits book',
                ),
                controller: todoController,
                onEditingComplete: tagsFocusNode.requestFocus,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                focusNode: tagsFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Tags,Priority',
                  prefixIcon: Icon(FontAwesomeIcons.tag),
                ),
                controller: tagsController,
                onEditingComplete: () {
                  _todo = TodoModel(
                    title: todoController.text,
                    colorNumber: Colors.primaries.indexOf(
                      _selectedColor ?? Colors.grey,
                    ),
                    activity: TodoActivity.active,
                    id: const Uuid().v1(),
                    createdTime: DateTime.now(),
                  );
                  widget.onCompleted(_todo);
                },
              ),
            ),
            if (tagsFocusNode.hasFocus)
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(4),
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(
                        height: 36,
                        child: FilterChip(
                          showCheckmark: false,
                          label: Text(
                            TodoPriority.values
                                .elementAt(index)
                                .toLocalize(context),
                          ),
                          padding: const EdgeInsets.all(6),
                          pressElevation: 1,
                          selected: _selectedTodo ==
                              TodoPriority.values.elementAt(index),
                          onSelected: (value) {
                            setState(() {
                              _selectedTodo =
                                  TodoPriority.values.elementAt(index);

                              tagsController
                                ..text = TodoPriority.values
                                    .elementAt(index)
                                    .toLocalize(context)
                                ..selection = TextSelection.fromPosition(
                                  TextPosition(
                                    offset: tagsController.text.length,
                                  ),
                                );
                            });
                          },
                        ),
                      ),
                    ),
                  ),
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

mixin TodoValidationMixin {
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
