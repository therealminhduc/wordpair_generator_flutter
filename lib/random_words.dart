//import the material design
import 'package:flutter/material.dart';

//import english_words package which will give the main functionnality of the project
//https://pub.dev/packages/english_words
import 'package:english_words/english_words.dart';

// class RandomWords
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

//class RandomWordsState : where we handle all UI stuff
class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];

  //Set = collection of object where each object can only appears once
  final _savedWordPairs = Set<WordPair>();

  Widget _buildList() {
    // .builder makes ListView dynamic
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair);

    //ListTile = row
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 16.0),
      ),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedWordPairs.remove(pair);
          } else {
            _savedWordPairs.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
        return ListTile(
            title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16)));
      });

      //conver the all chosen row to a list
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      //make icon button functional
      return Scaffold(
        appBar: AppBar(title: Text('Saved WordPairs')),
        body: ListView(children: divided),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),

          //button access to the favorite words list
          actions: <Widget>[
            IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
          ],
        ),
        body: _buildList());
  }
}
