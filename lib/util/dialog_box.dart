import 'package:flutter/material.dart';
import 'package:todo_list_flutter/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox(
      {Key? key,
      required this.textEditingController,
      required this.onSave,
      required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'Save', onPressed: onSave),
                const SizedBox(width: 10),
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
