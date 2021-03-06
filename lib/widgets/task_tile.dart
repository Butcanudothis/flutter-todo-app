import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function deletionCallback;
  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.deletionCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deletionCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.w500,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.orangeAccent,
        checkColor: Colors.blueGrey.shade900,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

// class TaskCheckbox extends StatelessWidget {
//   final bool checkboxState;
//   final Function toggleCheckboxState;
//   TaskCheckbox({this.checkboxState, this.toggleCheckboxState});
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
