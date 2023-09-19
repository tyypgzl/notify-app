import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChipInput extends StatefulWidget {
  const ChipInput({super.key});

  @override
  State<ChipInput> createState() => _ChipInputState();
}

class _ChipInputState extends State<ChipInput> {
  final chips = List.generate(3, (index) => 'Chip ${index + 1}').toSet();
  final controller = TextEditingController();
  final focusNode = FocusNode();
  final focusKeyboard = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    focusKeyboard.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: GestureDetector(
        onTap: focusNode.unfocus,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Input Chips Challenge'),
          ),
          body: RawKeyboardListener(
            focusNode: focusKeyboard,
            onKey: (key) {
              if (controller.text.isEmpty &&
                  key is RawKeyDownEvent &&
                  key.data.logicalKey == LogicalKeyboardKey.backspace) {
                setState(() {
                  chips.remove(chips.last);
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: GestureDetector(
                  onTap: focusNode.requestFocus,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    isFocused: focusNode.hasFocus,
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ...chips.map(
                          (value) => Chip(
                            label: Text(
                              value,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onDeleted: () {
                              setState(() {
                                chips.remove(value);
                              });
                            },
                            deleteIcon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        EditableText(
                          focusNode: focusNode,
                          backgroundCursorColor: Colors.transparent,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          controller: controller,
                          maxLines: null,
                          forceLine: false,
                          onChanged: (value) {
                            if (value.isEmpty) return;
                            final lastCharacter = value.characters.last;
                            if (lastCharacter == ',') {
                              final word = value.substring(0, value.length - 1);
                              setState(() {
                                chips.add(word);
                              });
                              controller.clear();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
