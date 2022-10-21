import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main(){
  runApp(MaterialApp(
      home: MyApp(),
      theme: themeData,
  ));
}
final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightGreenAccent,
);

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    return Scaffold(
        body: Center(
          child: TextButton(
            onPressed: (){
              Navigator.push(context, PageTwo());
            },
          child: Text(wordPair.asPascalCase),
          )
    )
    );
  }
}

class PageTwo extends MaterialPageRoute<void> {
  PageTwo() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1.0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, PageThree());
          },
          child: Text('Page Three'),
        ),
      ),
    );
  });
}

class PageThree extends MaterialPageRoute<void> {
  PageThree() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .accentColor,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          },
          child: Text('Back home'),
        ),
      ),
    );
  });
}