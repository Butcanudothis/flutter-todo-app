import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_todo/screens/add_task_screen.dart';
import 'package:flutter_todo/widgets/task_list.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:provider/provider.dart';

class Data extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
  addTask(String t) {
    tasks.add(Task(name: t));
    notifyListeners();
  }
}

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: Icon(
          Icons.add,
          color: Colors.blueGrey.shade900,
        ),
        elevation: 1.5,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => AddTaskScreen(
                  // addTaskCallback: (newTaskTitle) {
                  //   setState(() {
                  //     //  tasks.add(Task(name: newTaskTitle));
                  //   });
                  //   Navigator.pop(context);
                  // },
                  ));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.only(left: 30, right: 30.0, top: 60, bottom: 30.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade900,
                    radius: 30.0,
                    child: Icon(
                      Icons.track_changes,
                      color: Colors.orangeAccent,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Just do it.',
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${Provider.of<Data>(context).tasks.length} Tasks',
                    style: TextStyle(
                        color: Colors.blueGrey.shade900,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: TaskList(
                tasks: Provider.of<Data>(context).tasks,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
