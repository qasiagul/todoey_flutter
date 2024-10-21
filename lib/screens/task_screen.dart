import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';

import '../model/task.dart';
import '../widgets/task_list.dart';
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}
class _TaskScreenState extends State<TaskScreen> {
  
  List<Task> tasks =[
    Task(name: 'buy milk',),
    Task(name: 'buy friuts',),
    Task(name: 'buy eggs',),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddTaskScreen(
                addTaskCallback: (newTaskTitle){
                  setState(() {
                    tasks.add(Task(name: newTaskTitle));
                  });
                  Navigator.pop(context);
              }
              )
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child:const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const    CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 30,
                    ),
                  ),
                  const  SizedBox(
                    height: 10.0,
                  ),
                 const Text('Todoey',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700)),
                InkWell(
                  onLongPress: (){},
                   child:   Text(
                    '${tasks.length} Tasks',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                )
                ],
              )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: TaskList(tasks),
            ),
          ),
        ],
      ),
    );
  }
}
