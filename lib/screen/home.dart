import 'package:flutter/material.dart';
import '../model/user.dart';
import 'todolist.dart';

class Login extends StatelessWidget {
  const Login ({super.key});

  @override
  Widget build(BuildContext context) {
    return  _LoginPState();
    
  }
}


class _LoginPState extends StatefulWidget {
  const _LoginPState({super.key});

  @override
  State<_LoginPState> createState() => __LoginPStateState();
}

class __LoginPStateState extends State<_LoginPState> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  var message = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor:  const Color.fromARGB(255, 237, 228, 239),
        appBar: AppBar(
        backgroundColor:   const Color.fromARGB(255, 237, 228, 239),
        title:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            CircleAvatar(
            radius: 20,  // Taille de la photo
            backgroundImage: NetworkImage('https://picsum.photos/250?image=5'), // Remplacer par l'URL de ton image
          ),

          ]
        ),
        ),
        drawer: Drawer(
        child: ListView(
          children: [ListTile(title: Text("Home"))],
        ),
      ),
        body: Container(
        child: Column(
          children: [
            TextField(
              controller: _username,
              decoration:InputDecoration(
                label: Text("Username")
              ),
            ),
            TextField(
              controller: _password,
              decoration:InputDecoration(
                label: Text("Password")
              ),
              obscureText: true,
            ),
            Text(message),
            ElevatedButton(onPressed: login, child: Text('Login'))
          ],
        ),
    )
        // bottomNavigationBar: AddTodo(),
      );

  }

  void login(){
    final username = _username.text;
    final password = _password.text;
    

    if (username.isEmpty || password.isEmpty) {
      return;
    }

    final User user = users.firstWhere(
      (user)=>user.username == username && user.password == password,
      orElse: () => User('','')
    );

    if (user.username.isEmpty) {
      message = "user non trouvé";
    }else{
      Navigator.pushReplacement(
      context,  MaterialPageRoute(builder: (context) => Todolist()));  
    }
    
  }
}