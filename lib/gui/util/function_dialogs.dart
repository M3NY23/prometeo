import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

Future<String> showLineDialog(BuildContext context,
    {String title = "Input"}) async {
  TextEditingController controller = TextEditingController();
  final result = await showDialog<String>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: KeyboardListener(
                focusNode: FocusNode(),
                onKeyEvent: (value) {
                  if (value.logicalKey == LogicalKeyboardKey.enter) {
                    context.pop(controller.text);
                  } else if (value.logicalKey == LogicalKeyboardKey.escape) {
                    context.pop();
                  }
                },
                child: TextField(
                  controller: controller,
                  autofocus: true,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      context.pop(controller.text);
                    },
                    child: const Text("Ok")),
              ],
            );
          }) ??
      "";
  return result;
}
