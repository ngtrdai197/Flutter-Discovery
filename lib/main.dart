import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:myapp/ListWord.dart';

void main() => runApp(MyApp());

class RandomEnglishWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomEnglishState();
  }
}

class RandomEnglishState extends State<RandomEnglishWord> {
  final _words = <WordPair>[];
  final _checkWords = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List of English words - 123321"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.list,
              size: 27.0,
              color: Colors.white,
            ),
            onPressed: _pushToSaveWordsNewScreen,
          )
        ],
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(5));
        }
        return _buildRow(_words[index], index);
      }),
    );
  }

  _pushToSaveWordsNewScreen() {
    print("You pressed ...");
    // final pageRoute = new MaterialPageRoute(builder: (context) {
    //   final listTiles = _checkWords.map((word) {
    //     return new ListTile(
    //       title: new Text(
    //         word.asUpperCase,
    //         style: new TextStyle(fontSize: 20.0),
    //       ),
    //     );
    //   });
    //   return new Scaffold(
    //     appBar: new AppBar(
    //       title: Text("List of the words you choice"),
    //     ),
    //     body: new ListView(children: listTiles.toList()),
    //   );
    // });
    // Navigator.of(context).push(pageRoute);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ListWord(words: _checkWords)));
  }

  Widget _buildRow(WordPair word, int index) {
    final color = index % 2 == 0 ? Colors.blue : Colors.red;
    final isChecked = _checkWords.contains(word);
    return new ListTile(
      leading: new Icon(
        isChecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: color,
      ),
      title: new Text(
        word.asUpperCase,
        style: new TextStyle(fontSize: 20.0, color: color),
      ),
      onTap: () {
        setState(() {
          if (isChecked) {
            _checkWords.remove(word);
          } else {
            _checkWords.add(word);
          }
        });
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "This is my first Flutter App", home: RandomEnglishWord());
  }
}
