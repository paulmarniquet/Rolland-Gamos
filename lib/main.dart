import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    return MaterialApp(
      color: Colors.blue,
      title: 'Featurine',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Featurine'),
          centerTitle: true,
          toolbarHeight :100,
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}