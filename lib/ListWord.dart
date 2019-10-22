import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListWord extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Set words;

  // In the constructor, require a Todo.
  ListWord({Key key, @required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List of the words you choice"),
        ),
        body: words.length > 0
            ? new ListView.builder(
                itemCount: words.length,
                itemBuilder: (context, index) {
                  return new ListTile(
                      title: new Text(
                    '${words.toList()[index]}',
                    style: new TextStyle(fontSize: 20.0, color: Colors.red),
                  ));
                },
              )
            : new Center(
                child: new Text(
                  "Khong co du lieu",
                  style: new TextStyle(fontSize: 30, color: Colors.redAccent),
                ),
              ));
  }
}
