//import the material design
import 'package:flutter/material.dart';
import './random_words.dart';

//main function
void main() => runApp(MyApp());

//MyApp is a core/root widget

/*
class MyApp extends StatelessWidget {
  //run, override the build methode because the stateless widget has a build method
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: Scaffold(
          appBar: AppBar(title: Text('WordPair Generator')),
          body: Center(child: Text(wordPair.asPascalCase )),
        ));
  }
}
*/

/* we can basically do 
    void main() => runApp(MaterialApp());
  but not recommended */

/* MaterialApp class : An application that uses material design
  Widget that wraps a number of widgets that are commnsly required for material design applications */

/* home : what's going to show in the UI
  example : home : Scaffold() */

/* Scaffold : high level widget which can where can have multilple lower level widgets inside and different properties */

class MyApp extends StatelessWidget {
  //run, override the build methode because the stateless widget has a build method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: RandomWords());
  }
}
