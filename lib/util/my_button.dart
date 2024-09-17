import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  AddTaskButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white10,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
