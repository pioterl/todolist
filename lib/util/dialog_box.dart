import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white70,
      content: Container(
        height: 300,
        width: 400,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: "Type new task",
                  hintStyle: TextStyle(color: Colors.black26)),
              style: TextStyle(color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
