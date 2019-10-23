import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/category-selector.dart';
import 'package:myapp/widgets/favorite_contact.dart';
import 'package:myapp/widgets/recent_chat.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget _appBarHeader = new AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      title: Center(
        child: Text(
          "App Chat UI",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
        ),
      ),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
    return new Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: _appBarHeader,
        body: Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
              // Expanded dùng để lấy hết height còn lại của màn hình, ko cần phải set cứng height cố định
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: Column(
                    children: <Widget>[FavoriteContact(), RecentChats()],
                  )),
            )
          ],
        ));
  }
}
