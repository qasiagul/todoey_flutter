import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/provider_state_management/provider/auth_provider.dart';
// part - 10 how to implement login with rest api with provider
 class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

   @override
   State<LoginScreen> createState() => _LoginScreenState();
 }

 class _LoginScreenState extends State<LoginScreen> {
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   @override
   Widget build(BuildContext context) {
     final authProviver = Provider.of<AuthProvider>(context);
     return Scaffold(
       appBar: AppBar(
         title: Text('Login Screen'),
         centerTitle: true,
       ),
       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             TextFormField(
               controller: emailController,
               decoration: InputDecoration(
                 hintText: 'Email'
               ),
             ),
            SizedBox(height: 20.0,),
             TextFormField(
               controller: passwordController,
               decoration: InputDecoration(
                   hintText: 'Password'
               ),
             ),
             SizedBox(height: 20.0,),
             InkWell(
               onTap: (){
                 authProviver.login(
                     emailController.text.toString(),
                     passwordController.text.toString()
                 );
               },
               child: Container(
                 height: 50,
                 decoration: BoxDecoration(
                   color: Colors.yellow,
                   borderRadius: BorderRadius.circular(20.0)
                 ),
                 child: Center(
                   child: authProviver.loading ? CircularProgressIndicator(color: Colors.white,) : Text('Login'),
                 ),
               ),
             ),
           ],
         ),
       ),
     );
   }
 }
