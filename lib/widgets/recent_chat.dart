import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/message_model.dart';
import 'package:myapp/screens/chat_screen.dart';

class RecentChats extends StatefulWidget {
  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatScreen(user: chats[index].sender))),
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: 7.0, left: 7.0, top: 10.0, right: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: !chats[index].isReaded
                        ? Color(0xFFFFEFEE)
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(chats[index].sender.imageUrl),
                        radius: 25.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.58,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 3.0),
                                    child: Text(
                                      chats[index].sender.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17.0),
                                    ),
                                  ),
                                  Text(chats[index].content,
                                      overflow: TextOverflow.ellipsis)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7.0),
                        child: Column(
                          children: <Widget>[
                            Text(chats[index].time),
                            !chats[index].isReaded
                                ? Container(
                                    margin: EdgeInsets.only(top: 5.0),
                                    width: 40.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Text(
                                      !chats[index].isReaded ? 'NEW' : '',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0),
                                    ),
                                    alignment: Alignment.center,
                                  )
                                : Text(''),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          }),
    ));
  }
}
