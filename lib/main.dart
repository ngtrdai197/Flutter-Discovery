import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "This is my first Flutter App",
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(accentColor: Color(0xFFFEF9EB), primaryColor: Colors.red),
        home: HomeScreen());
  }
}
