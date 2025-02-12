import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../model/user.dart';
import './flip_effect.dart';
import 'todolist.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 228, 239),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 228, 239),
        elevation: 0,
        centerTitle: true,
        title: Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField("Username", Icons.person, _username),
              SizedBox(height: 15),
              _buildTextField("Password", Icons.lock, _password, isPassword: true),
              SizedBox(height: 10),
              if (message.isNotEmpty)
                Text(
                  message,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              SizedBox(height: 20),
              
              // Bouton de connexion stylisé
               CardFlipButton(
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[300],
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vous n'avez pas de compte? ",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  TextButton(
                    onPressed: to_register,
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(fontSize: 16, color: Colors.pink[300]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.grey[600]),
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
  void to_register(){
    Navigator.push(context, MaterialPageRoute(builder:(context)=> const Login()));
  }

  void login() {
    final username = _username.text;
    final password = _password.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        message = "Veuillez remplir tous les champs.";
      });
      return;
    }

    final User user = users.firstWhere(
      (user) => user.username == username && user.password == password,
      orElse: () => User('', ''),
    );

    if (user.username.isEmpty) {
      setState(() {
        message = "Utilisateur non trouvé. Vérifiez vos informations.";
      });
    } else {
      Navigator.push(context,PageTransition(
        type:PageTransitionType.leftToRight,
        child: const Todolist(),
        duration: Duration(seconds: 1),
      )  );
    }
  }
}
