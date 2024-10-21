import 'package:flutter/material.dart';

  class NotifyListnerScreen extends StatelessWidget {
     NotifyListnerScreen({super.key});

  ValueNotifier<int>_counter = ValueNotifier<int>(0);
  ValueNotifier<bool>_toggle = ValueNotifier<bool>(true);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Stateless'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: _toggle,
                builder: (context,value,chile){
                  return TextFormField(
                    obscureText: _toggle.value,
                    decoration: InputDecoration(
                        hintText: 'password',
                        suffix: InkWell(
                          onTap: (){
                            _toggle.value =!_toggle.value;
                          },
                          child: Icon(_toggle.value ? Icons.visibility_off_outlined : Icons.visibility),
                        )

                    ),
                  );
                }),

            Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context,value,child){
                    return  Center(child: Text(_counter.value.toString(),style: TextStyle(fontSize: 50),));
                  },
              ),
            ),
          ],
        ),
        floatingActionButton:
        FloatingActionButton(
            onPressed: (){
              _counter.value++;
              print(_counter.value);
            },
          child: Icon(Icons.add),
        ),
      );
    }
  }
  