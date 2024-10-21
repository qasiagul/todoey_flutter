import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
   RoundedButton({required this.title});

   final Text title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(20)
      ),
      child:Center(
          child: Text(
              title as String,
            style: TextStyle(fontSize: 25,color: Colors.black),
          )
      ),
    );
  }
}
