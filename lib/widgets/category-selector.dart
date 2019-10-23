import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = ['Message', 'Online', 'Group', 'Offline'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65.0,
        color: Theme.of(context).primaryColor,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        color: index == selectedIndex
                            ? Colors.white
                            : Colors.grey[350],
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                        letterSpacing: 1.5),
                  ),
                ),
              );
            }));
  }
}
