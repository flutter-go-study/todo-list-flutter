import 'package:flutter/material.dart';
import 'package:todo_list_flutter/components/dialog_box.dart';
import 'package:todo_list_flutter/components/todo_tile.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List tasks = [
    ["Make tutorial", false],
    ["Do exercise", false],
  ];

  void checkBoxChanged(bool? value, index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox();
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
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TodoTile(
                taskName: tasks[index][0],
                taskCompleted: tasks[index][1],
                onCheckboxChanged: (value) {
                  checkBoxChanged(value, index);
                });
          }),
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


  // body:
  //      Container(
  //         padding: const EdgeInsets.all(24),
  //         child: Column(
  //           children: [
  //             TextField(
  //               controller: _textEditingController,
  //             ),
  //             SizedBox(
  //               height: 316,
  //               child: ListView.separated(
  //                 separatorBuilder: (context, index) => const Divider(),
  //                 itemBuilder: (context, index) {
  //                   return (ListTile(
  //                     title: Text(tasks[index]),
  //                     onLongPress: () => setState(() {
  //                       tasks.removeAt(index);
  //                     }),
  //                   ));
  //                 },
  //                 itemCount: tasks.length,
  //               ),
  //             )
  //           ],
  //         ))
  //         ,