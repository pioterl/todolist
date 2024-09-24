import 'package:flutter/material.dart';
import 'package:untitled/util/new_task_button.dart';

class NewTaskDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  NewTaskDialog(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3), // Set the roundness here
      ),
      content: SizedBox(
        height: 85,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              autofocus: true,
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: buildUnderlineInputBorder(
                    context, Theme.of(context).colorScheme.primary),
                disabledBorder: buildUnderlineInputBorder(
                    context, Theme.of(context).colorScheme.primary),
                focusedBorder: buildUnderlineInputBorder(
                    context, Theme.of(context).colorScheme.tertiary),
                hintText: "Type new task",
                hintStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              onSubmitted: (value) {
                onSave();
              },
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NewTaskButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 4),
                NewTaskButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }

  UnderlineInputBorder buildUnderlineInputBorder(
      BuildContext context, Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color),
    );
  }
}
