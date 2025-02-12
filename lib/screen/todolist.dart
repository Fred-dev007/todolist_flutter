import 'package:flutter/material.dart';
import 'home.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  _TodolistState createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  final TextEditingController _controller = TextEditingController();
  List<String> todos = [
    "Prendre du Pain",
    "Prendre du lait",
    "Finaliser ma todolist",
    "Prendre mon phone",
    "Prendre du bon Klaklo"
  ];

  void _addTodo(){
    if (_controller.text.isNotEmpty) {
      setState(() {
        todos.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=> const Todolist()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil")
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Deconnexion"),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=> const Login()));
              },
            ),

            ],
        ),
      ),
        body: Container(
      child: Column(
        children: [
          Container(
            child:Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            )
            )
          ),
         Container(
          child: Text("All Todos",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
          )
        ),
         Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Todos(
                    todo: todos[index],
                    onDelete: () => _removeTodo(index),
                  );
                },
              ),
            ),
             AddTodo(controller: _controller, onAdd: _addTodo),
        ],
      ),
    )
        // bottomNavigationBar: AddTodo(),
      );
  }
}


class Todos extends StatefulWidget {
  final String todo; 
  final VoidCallback onDelete;
  const Todos({super.key, required this.todo, required this.onDelete});

  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 350,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue!;
                  });
                },
              ),
              Expanded(
                child: Text(
                  widget.todo,
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: widget.onDelete,
                
              ),
              SizedBox(height: 15,)
            ],
          ),
      
        ),
      ),
    );
  }
}


// Barre d'ajout de tâche
class AddTodo extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;
  const AddTodo({super.key, required this.controller, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Entrez une nouvelle tâche...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: onAdd,
          child: Icon(Icons.add, size: 40),
        ),
      ],
    );
  }
}