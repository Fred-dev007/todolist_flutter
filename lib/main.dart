import 'package:flutter/material.dart';
import 'package:todolist/routes/routes.dart';
import 'screen/todolist.dart';
import 'screen/home.dart';
import 'screen/register.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final Routes route = Routes();
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        fontFamily: "Roboto"
      ),
      home: Login(),
      // initialRoute: '/',
      // routes:route.getRoute()
    );
  }
}

