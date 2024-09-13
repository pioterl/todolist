import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final _myBox = Hive.box("myBox");

  void createInitDb() {
    toDoList = [
      ["Example task", false],
      ["Another task", false],
    ];
  }

  void loadDb() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDb() {
    _myBox.put("TODOLIST", toDoList);
  }
}
