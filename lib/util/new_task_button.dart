import 'package:flutter/material.dart';

class NewTaskButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  NewTaskButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
      ),
    );
  }
}
