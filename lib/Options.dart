import 'package:flutter/material.dart';
import 'GenerateRapperWidget.dart';
import 'Buttons.dart';

class OptionsPage extends MaterialPageRoute<void> {
  OptionsPage()
      : super(builder: (BuildContext context) {
          return Scaffold(
            body: Center(
                child: Column(children: [
              const BackHomeButton(),
              const SizedBox(height: 120),
              const Text("DIFFICULTÉ",
              style: TextStyle(fontFamily: 'SansSerif', fontSize: 30, color: Colors.white)),
              const SizedBox(height: 100),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                BlueCan(),
                GreenCan(),
                RedCan(),
              ],
              ),
              const SizedBox(height: 150),
              const musicLogo(),
            ])),
            backgroundColor: const Color.fromARGB(255, 254, 129, 106),
          );
        });
}

class BlueCan extends StatelessWidget {
  const BlueCan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( children: <Widget>[
      GestureDetector(
          onTap: () {
            GlobalData.difficulty = 1;
            Navigator.pop(context);
          },
          child: Image.asset(
              "assets/images/blue_can.png",
              scale: 3.8)),
    const SizedBox(height: 10),
    const Text("30", style: TextStyle(fontFamily: 'SansSerif', fontSize: 20, color: Colors.white)),
    ]);
  }
}

class RedCan extends StatelessWidget {
  const RedCan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( children: <Widget>[
      GestureDetector(
          onTap: () {
            GlobalData.difficulty = 3;
            Navigator.pop(context);
          },
          child: Image.asset(
              "assets/images/red_can.png",
              scale: 3.8)),
    const SizedBox(height: 10),
    const Text("90", style: TextStyle(fontFamily: 'SansSerif', fontSize: 20, color: Colors.white)),
    ]);
  }
}

class GreenCan extends StatelessWidget {
  const GreenCan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( children: <Widget>[
      GestureDetector(
          onTap: () {
            GlobalData.difficulty = 2;
            Navigator.pop(context);
          },
          child: Image.asset(
              "assets/images/green_can.png",
              scale: 3.8)),
    const SizedBox(height: 10),
    const Text("60", style: TextStyle(fontFamily: 'SansSerif', fontSize: 20, color: Colors.white)),
    ]);
  }
}