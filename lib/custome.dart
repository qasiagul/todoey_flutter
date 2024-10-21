import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/RoundedButton.dart';
import 'package:todoey_flutter/provider_state_management/favourite/favourite_screen.dart';

class UseCustomeWidget extends StatelessWidget {
  const UseCustomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // InputType(email: 'Email', icon:Icon(Icons.email)),
          // InputType(email: 'password', icon:Icon(Icons.password)),
          // RoundedButton(text: 'Login', color:Colors.blue),
          ReusableWidgit(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen()));
          },)
        ],
      ),
    );
  }
}

class ReusableWidgit extends StatelessWidget {
  ReusableWidgit({required this.onTap});
  late final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index){
        return InkWell(
          onTap: onTap,
          child: ListTile(
            leading: Icon(Icons.play_circle_fill_sharp,color: Colors.blue,),
            title: Text('Chapter1',style: TextStyle(fontSize: 20),),
            subtitle: Text('this is my subtitle',style: TextStyle(fontSize: 18),),
            trailing: Text('1:00 pm'),
          ),
        );
      }),
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: 250,
        height: 50,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}

class InputType extends StatelessWidget {
  InputType({required this.email, required this.icon});
  late final String email;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText:email,
          suffixIcon: icon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),

          )
        ),

      ),
    );
  }
}
