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
      content: Container(
        height: 85,
        width: 400,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Type new task",
                  hintStyle: TextStyle(color: Colors.white38)),
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                SizedBox(width: 4),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
