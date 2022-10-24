import "game.dart";
import 'main.dart';
import 'options.dart';
import 'package:flutter/material.dart';

class GenerateRapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: <Widget>[

          GestureDetector(
              onTap: () {
                //
              },
              child: Image.network(
                  "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/rappername.png?raw=true",
                  width: 275,
                  height: 275))
        ]));
  }
}

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, OptionsPage());
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/cube-down.png?raw=true",
                width: 100,
                height: 100)));
  }
}

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, PlayPage());
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/cube-up.png?raw=true",
                width: 100,
                height: 100)));
  }
}

class musicLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Image.network(
            "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/redbull_logo.png?raw=true",
            width: 120,
            height: 120));
  }
}

class PageTwo extends MaterialPageRoute<void> {
  PageTwo()
      : super(builder: (BuildContext context) {
          return Scaffold(
            body: Center(
                child: Column(
                  children: [
              GenerateRapper(),
              Play(),
              Options(),
              musicLogo(),
            ])),
            backgroundColor: const Color.fromARGB(255, 254, 220, 70),
          );
        });
}
