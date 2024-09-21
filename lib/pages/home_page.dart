import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data/database.dart';
import 'package:untitled/util/theme_provider.dart';
import '../util/dialog_box.dart';
import '../util/theme.dart';
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

  void changeTaskStatus(bool? value, int index) {
    setState(() {
      database.toDoList[index][1] = value ?? false;
      var selectedTask = database.toDoList[index];
      database.toDoList.removeAt(index);
      if (value == false) {
        database.toDoList.insert(0, selectedTask);
      } else {
        int insertIndex =
            database.toDoList.indexWhere((item) => item[1] == true);
        if (insertIndex == -1) {
          database.toDoList.add(selectedTask);
        } else {
          database.toDoList.insert(insertIndex, selectedTask);
        }
      }
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
      database.toDoList.insert(0, [_controller.text, false]);
      _controller.clear();
    });
    database.updateDb();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: buildAppBar(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: createNewTask,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: buildTaskList(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "To do",
        style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
      ),
      actions: <Widget>[
        IconButton(
          onPressed:
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme,
          icon: Icon(
            Provider.of<ThemeProvider>(context).themeData == darkMode
                ? Icons.toggle_off
                : Icons.toggle_on,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }

  ListView buildTaskList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ToDoTile(
          taskName: database.toDoList[index][0],
          taskCompleted: database.toDoList[index][1],
          onChanged: (value) => changeTaskStatus(value, index),
          delete: (context) => deleteTask(index),
        );
      },
      itemCount: database.toDoList.length,
    );
  }

  void deleteTask(int index) {
    setState(() {
      database.toDoList.removeAt(index);
    });
    database.updateDb();
  }
}
