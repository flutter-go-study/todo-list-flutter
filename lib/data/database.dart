import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List tasks = [];

  final _myBox = Hive.box('todo');

  void createInitialData() {
    tasks = [
      ['Task 1', false],
      ['Task 2', false],
    ];
  }

  void loadData() {
    tasks = _myBox.get('tasks');
  }

  void updateDataBase() {
    _myBox.put('tasks', tasks);
  }
}
