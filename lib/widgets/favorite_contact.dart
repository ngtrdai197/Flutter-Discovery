import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/message_model.dart';

class FavoriteContact extends StatefulWidget {
  @override
  _FavoriteContactState createState() => _FavoriteContactState();
}

class _FavoriteContactState extends State<FavoriteContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Favorite contact',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 16.0),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.blueGrey,
                    size: 30.0,
                  ),
                  onPressed: () {
                    print("Tapped...");
                  },
                )
              ],
            )),
        Container(
            height: 100.0,
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15.0),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              AssetImage(favorites[index].imageUrl),
                        ),
                        Text(favorites[index].name)
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}
