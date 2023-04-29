import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_flutter/data/database.dart';
import 'package:todo_list_flutter/util/dialog_box.dart';
import 'package:todo_list_flutter/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('todo');
  ToDoDataBase db = ToDoDataBase();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    if (_myBox.get('tasks') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1];
    });
    db.updateDataBase();
  }

  void onSaveTask() {
    _textEditingController.text.isEmpty
        ? null
        : setState(() {
            db.tasks.add([_textEditingController.text, false]);
            _textEditingController.clear();
            Navigator.of(context).pop();
          });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogBox(
              textEditingController: _textEditingController,
              onSave: onSaveTask,
              onCancel: Navigator.of(context).pop);
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.tasks.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'TO DO',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.74,
        child: ListView.builder(
            itemCount: db.tasks.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: db.tasks[index][0],
                taskCompleted: db.tasks[index][1],
                onCheckboxChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () {
                createNewTask();
              },
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.add,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
