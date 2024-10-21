import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/custome.dart';
import 'package:todoey_flutter/provider_state_management/favourite/favourite_screen.dart';
import 'package:todoey_flutter/provider_state_management/provider/auth_provider.dart';
import 'package:todoey_flutter/provider_state_management/screens/dark_theme.dart';
import 'package:todoey_flutter/provider_state_management/provider/count_provider.dart';
import 'package:todoey_flutter/provider_state_management/provider/example_one_provider.dart';
import 'package:todoey_flutter/provider_state_management/provider/favourite_provider.dart';
import 'package:todoey_flutter/provider_state_management/provider/theme_changer_provider.dart';
import 'package:todoey_flutter/provider_state_management/provider/second_example_provider.dart';
import 'package:todoey_flutter/provider_state_management/screens/login_screen.dart';
import 'package:todoey_flutter/provider_state_management/screens/value_notify_listner.dart';
import 'package:todoey_flutter/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => SecondExampleProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child:Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChanger>(context);
        return  MaterialApp(
          themeMode:themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.yellow,
              appBarTheme:const AppBarTheme(color: Colors.yellow),
              iconTheme: IconThemeData(color: Colors.yellow),
              focusColor: Colors.yellow

            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
                primarySwatch: Colors.purple,
                appBarTheme:const AppBarTheme(color: Colors.purple)


            ),
            debugShowCheckedModeBanner: false,
            home: TaskScreen()
        );
      }),
    );
  }
}
