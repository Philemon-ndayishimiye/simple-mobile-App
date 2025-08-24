import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Nextpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text("next page")),
      body: Column(
        children: [Text("hello every one "), Text("my name are philemon")],
      ),
    ));
  }
}
