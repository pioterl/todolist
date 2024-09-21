import 'package:flutter/material.dart';

class AddNewTaskButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  AddNewTaskButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
      ),
    );
  }
}
