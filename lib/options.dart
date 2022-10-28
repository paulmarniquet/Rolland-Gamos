import 'package:featurine/menu.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';

class OptionsPage extends MaterialPageRoute<void> {
  OptionsPage()
      : super(builder: (BuildContext context) {
          return Scaffold(
            body: Center(
                child: Column(children: [
              BackHomeButton(),
              const SizedBox(height: 120),
              const Text("DIFFICULTÉ",
              style: TextStyle(fontFamily: 'SansSerif', fontSize: 30, color: Colors.white)),
              const SizedBox(height: 100),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlueCan(),
                GreenCan(),
                RedCan(),
              ],
              ),
              const SizedBox(height: 150),
              musicLogo(),
            ])),
            backgroundColor: const Color.fromARGB(255, 254, 129, 106),
          );
        });
}

class BlueCan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column( children: <Widget>[
        GestureDetector(
            onTap: () {
              //
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/blue_can.png?raw=true",
                scale: 3.8)),
      const SizedBox(height: 10),
      const Text("Facile", style: TextStyle(fontFamily: 'SansSerif', fontSize: 20, color: Colors.white)),
      ]),
);
  }
}

class RedCan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column( children: <Widget>[
        GestureDetector(
            onTap: () {
              //
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/red_can.png?raw=true",
                scale: 3.8)),
      const SizedBox(height: 10),
      const Text("Difficile", style: TextStyle(fontFamily: 'SansSerif', fontSize: 20, color: Colors.white)),
      ]),
);
  }
}

class GreenCan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column( children: <Widget>[
        GestureDetector(
            onTap: () {
              //
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/green_can.png?raw=true",
                scale: 3.8)),
      const SizedBox(height: 10),
      const Text("Moyen", style: TextStyle(fontFamily: 'SansSerif', fontSize: 20, color: Colors.white)),
      ]),
);
  }
}