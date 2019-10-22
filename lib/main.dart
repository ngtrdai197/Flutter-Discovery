import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget contentBellow = new Container(
        margin: const EdgeInsets.only(top: 15.0),
        padding: const EdgeInsets.all(10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: new Text(
                      "Return data from a screen",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0),
                    ),
                  ),
                  new Text(
                    "In some cases, you might want to return data from a new screen. For example, say you push a new screen that presents two options to a user.",
                    style:
                        new TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: new Row(
                children: <Widget>[
                  new Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  new Text(" 100")
                ],
              ),
            )
          ],
        ));

    Widget buildButton(IconData icon, String buttonName) {
      return new Column(
        children: <Widget>[
          new Icon(
            icon,
            color: Colors.blue,
            size: 25.0,
          ),
          new Text(
            buttonName,
            style: TextStyle(fontSize: 17.0),
          ),
        ],
      );
    }

    Widget fourButtonSection = new Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButton(Icons.home, 'Home'),
          buildButton(Icons.arrow_back, 'Back'),
          buildButton(Icons.arrow_forward, 'Next'),
          buildButton(Icons.share, 'Share')
        ],
      ),
    );
    Widget aboutMe = new Container(
      padding: EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          new Text('''
          I'm Nguyen Dai,

          I am currently a final year student of the post and telecommunications technology school. Information technology major!
          I learned how to build a website with Front-End frameworks: Angular - Vuejs. As well as build mobile apps with: Ionic.
          In life I like to do and learn new things, but in work I like to learn new languages, good solutions to apply to work.
          ''')
        ],
      ),
    );
    return new MaterialApp(
        title: "",
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text("Flutter App"),
            ),
            body: new ListView(
              children: <Widget>[
                new Image.asset(
                  'images/5847f289cef1014c0b5e486b.png',
                  fit: BoxFit.contain,
                  height: 250.0,
                ),
                contentBellow,
                contentBellow,
                contentBellow,
                fourButtonSection,
                aboutMe
              ],
            )));
  }
}
