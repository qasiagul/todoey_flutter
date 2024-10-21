import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/provider_state_management/provider/count_provider.dart';


class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context , listen: false);
    Timer.periodic(Duration(seconds: 0), (timer) {
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    final countProvider = Provider.of<CountProvider>(context , listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child){
          print('only his widget is buil now');
          return Text(value.count.toString(),style: TextStyle(fontSize: 40));
        })
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            countProvider.setCount();
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
