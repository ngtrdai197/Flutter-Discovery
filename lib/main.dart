import 'package:flutter/material.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/http_interceptor.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String token = prefs.getString('token');
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String token;
  MyApp({Key key, @required this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "This is my first Flutter App",
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(accentColor: Color(0xFFFEF9EB), primaryColor: Colors.red),
        routes: Routes.routes,
        navigatorKey: navigatorKey,
        home: (token.isEmpty) ? LoginScreen() : HomeScreen());
  }
}
