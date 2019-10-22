import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(30));

  List<Stack> _buildGridTileList(int count) => List.generate(
      count,
      (int index) => Stack(
            alignment: const Alignment(0.0, 0.0),
            children: <Widget>[
              Container(
                child: Image.asset('images/pic${index}.jpg'),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                decoration:
                    BoxDecoration(color: Color.fromARGB(130, 71, 230, 236)),
                child: Text(
                  "${index + 1}",
                  style: TextStyle(color: Colors.white, fontSize: 23.0),
                ),
              )
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "This is my first Flutter App",
        home: Scaffold(
            appBar: AppBar(
              title: Text("List of English words"),
            ),
            body: Center(
              child: _buildGrid(),
            )));
  }
}
