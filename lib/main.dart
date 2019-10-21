import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class RandomEnglishWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomEnglishState();
  }
}

class RandomEnglishState extends State<RandomEnglishWord> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final _words = <WordPair>[];
    final _checkWords = new Set<WordPair>();

    Widget _buildRow(WordPair word, int index) {
      final color = index % 2 == 0 ? Colors.blue : Colors.red;
      final isChecked = _checkWords.contains(word);
      return new ListTile(
        leading: new Icon(
          !isChecked ? Icons.check_box : Icons.check_box_outline_blank,
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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List of English words"),
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(5));
        }
        return _buildRow(_words[index], index);
      }),
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
