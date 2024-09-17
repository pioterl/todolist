import 'package:flutter/material.dart';
import 'package:untitled/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black26,
      content: SizedBox(
        height: 80,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              autofocus: true,
              controller: controller,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: "Type new task",
                hintStyle: TextStyle(color: Colors.white38),
              ),
              style: const TextStyle(color: Colors.white70),
              onSubmitted: (value) {
                onSave();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddTaskButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 4),
                AddTaskButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
