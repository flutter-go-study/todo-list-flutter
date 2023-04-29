import 'package:flutter/material.dart';
import 'package:todo_list_flutter/components/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            Row(
              children: [
                MyButton(text: 'Save', onPressed: () {}),
                MyButton(text: 'Cancel', onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
