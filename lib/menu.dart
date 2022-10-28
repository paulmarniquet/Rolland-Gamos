import "game.dart";
import 'options.dart';
import 'package:flutter/material.dart';

class GenerateRapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      GestureDetector(
          onTap: () {
            //
          },
          child: Image.network(
            "https://cdn-icons-png.flaticon.com/512/3031/3031710.png",
            scale: 9,
          ))
    ]));
  }
}

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, PlayPage());
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/jouerbutton.png?raw=true",
                scale: 2.5)));
  }
}

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, OptionsPage());
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/niveaubutton.png?raw=true",
                scale: 2.8)));
  }
}

class musicLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
      "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/redbull_logo.png?raw=true",
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      colorBlendMode: BlendMode.modulate,
      scale: 9,
    ));
  }
}

class Menu extends MaterialPageRoute<void> {
  Menu()
      : super(builder: (BuildContext context) {
          MainAxisAlignment.start;
          return Scaffold(
            body: Center(
                child: Column(children: <Widget>[
              const SizedBox(height: 150),

              const Text("RAPPEUR", 
              style: TextStyle(fontFamily: 'SansSerif', fontSize: 30, color: Colors.white)),

              const SizedBox(height: 60),
              //GenerateRapper(),
              const SizedBox(height: 100),
              Play(),
              Transform.translate(offset: Offset(52, -35), child: Options()),
              const SizedBox(height: 80),
              musicLogo(),
            ])),
            backgroundColor: const Color.fromARGB(255, 250, 226, 120),
          );
        });
}
