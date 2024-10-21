
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddTaskScreen extends StatelessWidget {

  final Function? addTaskCallback;
  AddTaskScreen({this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return  Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.lightBlueAccent,fontSize: 30),),
           TextField(
            cursorColor: Colors.lightBlueAccent,
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText){
              newTaskTitle = newText;
            },
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
            ),
              onPressed: (){
             addTaskCallback!(newTaskTitle);
              },
              child: Text(
                'Add',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,),
              ),
          ),
        ],
      ),
    );
  }
}
