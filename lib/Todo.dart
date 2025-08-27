import 'dart:ffi';

import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<String> Todos = [];
  TextEditingController _inputTodo = TextEditingController();

  void _AddToDo() {
    if (_inputTodo.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("please enter your todo"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        Todos.add(_inputTodo.text);
        _inputTodo.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My To Do App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Text("This is Todo Page"),

          SizedBox(height: 25),

          SizedBox(
            width: 300,
            child: TextField(
              controller: _inputTodo,
              decoration: InputDecoration(
                labelText: "enter your to do ",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () => {_AddToDo()},
              child: Text("Add to Do", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ),

          Expanded(
            child: ListView(
              children: Todos.map((todo) {
                return Row(
                  children: [
                    Expanded(child: ListTile(title: Text(todo))),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("delete"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
