import '../screen/home.dart';
import '../screen/register.dart';
import '../screen/todolist.dart';
import 'package:flutter/material.dart';

class Routes {
 final Map<String, WidgetBuilder> _routes = 
    {
         '/register':(context) => const RegisterPage(),
        '/home' : (context)=> const Todolist(),
        '/' : (context)=> const Login(),
    };


    Map<String, WidgetBuilder> getRoute(){
      return _routes;
    }
  
}


