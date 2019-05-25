import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: Brightness.light,
        primaryColor: Colors.pink[600],
        accentColor: Colors.brown[600],
        // Define the default Font Family
        fontFamily: 'Lobster',
      ),
      title: 'My first flutter app',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Awesome Names Generator',
          style: TextStyle(fontSize: 28)
        ),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        if (i >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(i);
      },
    );
  }

  Widget _buildRow(int index) {
    final Color boxColor = index.isOdd ? Colors.brown[50] : Colors.pink[50];
    final Color textColor = index.isOdd
        ? Theme.of(context).primaryColor
        : Theme.of(context).accentColor;

    return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: boxColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 1),
              blurRadius: 2.0,
            )
          ],
        ),
        child: ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: TextStyle(fontSize: 18, color: textColor),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
