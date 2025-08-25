import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 

 // custom type for user  ListR
class User {
  int? id;
  String? name;
  int? age;
  User({required this.id, required this.age, required this.name});
}

class Nextpage extends StatelessWidget {
  List<User> users = [
    User(id: 1, age: 24, name: "philos"),
    User(id: 2, age: 20, name: "benjamin"),
    User(id: 3, age: 15, name: "byukusenge"),
  ];
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text("next page")),
      body: Column(
        children: users.map((user) {
          return Card(
            child: ListTile(
              title: Text("name : ${user.name}"),
              subtitle: Text("age : ${user.age}"),
            ),
          );
        }).toList(),
      ),
    ));
  }
}
