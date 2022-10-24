import 'dart:io';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: themeData,
  ));
}

final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightGreenAccent,
);

Image logo = Image.network(
    "https://addons-redbullrapjeuopenworld.redbull.com/assets/images/intro/logo-rap-jeu.png", width: 300, height: 300);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                    child: Stack(children: [
      GestureDetector(
        onTap: () {Navigator.push(context, PageTwo());},
        child: logo,
      )
    ]))));
  }
}

class PageTwo extends MaterialPageRoute<void> {
  PageTwo()
      : super(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
          ),
                body: Center(
                    child: Stack(children: [
        GestureDetector(onTap: () {Navigator.push(context, PageThree());},
        child: Image.network(
            "https://addons-redbullrapjeuopenworld.redbull.com/assets/images/intro/logo-rap-jeu.png", width: 300, height: 300),
      )
    ])
    ),
    backgroundColor: Colors.yellow,
    );
        });
}

class PageThree extends MaterialPageRoute<void> {
  PageThree()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).accentColor,
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
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
                child: Text('Back home'),
              ),
            ),
          );
        });
}
