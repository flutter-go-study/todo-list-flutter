import 'package:flutter/material.dart';
import 'package:todo_list_flutter/util/dialog_box.dart';
import 'package:todo_list_flutter/util/todo_tile.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List tasks = [];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  void onSaveTask() {
    _textEditingController.text.isEmpty
        ? null
        : setState(() {
            tasks.add([_textEditingController.text, false]);
            _textEditingController.clear();
            Navigator.of(context).pop();
          });
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
      tasks.removeAt(index);
    });
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
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: tasks[index][0],
                taskCompleted: tasks[index][1],
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
