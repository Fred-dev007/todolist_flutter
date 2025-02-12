import 'package:flutter/material.dart';
import 'home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password= TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Sign up",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Create your account",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField("Username", Icons.person,_username),
              SizedBox(height: 15),
              _buildTextField("Email", Icons.mail,_email),
              SizedBox(height: 15),
              _buildTextField("Password", Icons.password,_password, isPassword: true),
              SizedBox(height: 15),
              _buildTextField("Confirm Password", Icons.password,_passwordConfirm, isPassword: true),
              SizedBox(height: 25),

              // Bouton d'inscription
              ElevatedButton(
                onPressed: register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 15),
              Text("or", style: TextStyle(fontSize: 14, color: Colors.grey)),

              // Bouton Google
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: register,
                icon: Icon(Icons.login, color: Colors.white),
                label: Text("Sign in with Google"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Redirection vers Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  TextButton(
                    onPressed: to_login,
                    child: Text(
                      "Login",
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

  Widget _buildTextField(String hintText, IconData icon,TextEditingController control, {bool isPassword = false}) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: control,
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

  void register() {
    
  }

  void to_login() {
    Navigator.push(context, MaterialPageRoute(builder:(context)=> const Login()));
  }
}
