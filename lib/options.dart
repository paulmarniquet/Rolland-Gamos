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
              const Text("Options"),
              const SizedBox(height: 100),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlueCan(),
                GreenCan(),
                RedCan(),
              ],
              ),
              const SizedBox(height: 200),
              musicLogo(),
            ])),
            backgroundColor: const Color.fromARGB(255, 254, 98, 70),
          );
        });
}

class BlueCan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              //
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/blue_can.png?raw=true",
                scale: 3.8)));
  }
}

class RedCan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              //
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/red_can.png?raw=true",
                scale: 3.8)));
  }
}

class GreenCan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              //
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/green_can.png?raw=true",
                scale: 3.8)));
  }
}