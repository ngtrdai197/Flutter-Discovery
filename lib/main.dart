import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "This is my first Flutter App",
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text("List of English words"),
            ),
            body: new Center(
              child: new Text("Hello, world"),
            )));
  }
}
