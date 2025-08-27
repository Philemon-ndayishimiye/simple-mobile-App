import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:counterapp/NextPage.dart';
import 'package:counterapp/Todo.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _Login() async {
    if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "please Enter email and password",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
    final url = Uri.parse("https://dummyjson.com/auth/login");
    try {
      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": _emailController.text,
          "password": _passwordController.text,
        }),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final token = data['accessToken'];

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Todo()),
        );

        print(token);
      } else if (res.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Incorrect email or password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        print("failed to login");
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Please Login",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),

          SizedBox(height: 20),

          SizedBox(
            height: 50,
            width: 310,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "username",
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  letterSpacing: 2,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          SizedBox(
            width: 310,
            height: 60,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "password",
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  letterSpacing: 2,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () => {_Login()},
            child: Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
