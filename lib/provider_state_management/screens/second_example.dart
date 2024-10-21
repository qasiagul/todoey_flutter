import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/provider_state_management/provider/second_example_provider.dart';

class SecondExample extends StatefulWidget {
  const SecondExample({super.key});

  @override
  State<SecondExample> createState() => _SecondExampleState();
}

class _SecondExampleState extends State<SecondExample> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<SecondExampleProvider>(builder: (context,value,child){
            return Slider(
                min: 0,
                max:1,
                value: value.value, onChanged: (val){
                  value.setValue(val);
              print('only this widgit is build');

            });
          }),
          Consumer<SecondExampleProvider>(builder: (context,value,child){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: 50,backgroundColor: Colors.purple.withOpacity(value.value),),
                SizedBox(width: 20,),
                CircleAvatar(radius: 50,backgroundColor: Colors.orangeAccent.withOpacity(value.value),)
              ],
            );
          }),
          SizedBox(height: 20,),
          Consumer<SecondExampleProvider>(builder: (context,value,child){
            return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: 50,backgroundColor: Colors.lightBlueAccent.withOpacity(value.value),),
                SizedBox(width: 20,),
                CircleAvatar(radius: 50,backgroundColor: Colors.pinkAccent.withOpacity(value.value),)
              ],
            );
          }),

        ],
      ),
    );
  }
}
