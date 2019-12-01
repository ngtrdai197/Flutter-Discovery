import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/routes.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<List<UserNode>> users;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Login screen"),
          ),
        ),
        body: Container(
            child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      labelText: 'Enter your username',
                      hintText: 'Enter your username...'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Enter your password',
                      hintText: 'Enter your password...'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: Center(
                          child: RaisedButton(
                        child: Text('Submit'),
                        onPressed: () async {
                          print(
                              'usename: ${_usernameController.text} - password: ${_passwordController.text}');
                          if (_formKey.currentState.validate()) {
                            final bool isLogin = await authLogin(
                                _usernameController.text,
                                _passwordController.text);
                            if (isLogin) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Submit!'),
                              ));
                              Navigator.pushNamed(context, Routes.home);
                            }
                          }
                        },
                      )),
                    );
                  },
                )
              ],
            ),
          ),
        )));
  }
}
