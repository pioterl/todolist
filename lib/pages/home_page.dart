import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled/data/database.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box("myBox");
  ToDoDatabase database = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      database.createInitDb();
    } else {
      database.loadDb();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      database.toDoList[index][1] = !database.toDoList[index][1];
    });
    database.updateDb();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      database.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    database.updateDb();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(title: Text("To do")),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: database.toDoList[index][0],
            taskCompleted: database.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            delete: (context) => deleteTask(index),
          );
        },
        itemCount: database.toDoList.length,
      ),
    );
  }

  void deleteTask(int index) {
    setState(() {
      database.toDoList.removeAt(index);
    });
    database.updateDb();
  }
}
