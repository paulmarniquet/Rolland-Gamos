import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import "game.dart";
import 'options.dart';
import 'package:flutter/material.dart';

class GlobalData {
  static String rapname = "";
}

class GenerateRapper extends StatefulWidget {
  const GenerateRapper({super.key});
  @override
  _GenerateRapperState createState() => _GenerateRapperState();
}

class _GenerateRapperState extends State<GenerateRapper> {
  String textFromFile = "";
  int timeOnPage = 0;
  List<String> array = [];

  getData() async {
    String response;
    response = await rootBundle.loadString('assets/database');
    LineSplitter.split(response).forEach((line) => (array.add(line)));
    setState(() {
      textFromFile = array[Random().nextInt(array.length)];
      GlobalData.rapname = textFromFile;
    });
  }

  void timeOnPageFunc() {
    Timer.periodic(const Duration(milliseconds: 1), (timer) async {
      timeOnPage++;
      if (timeOnPage == 1) {
        getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    timeOnPageFunc();
    return Column(children: [
      const SizedBox(height: 50),
      Text(textFromFile,
          style: TextStyle(
              fontFamily: 'SansSerif', fontSize: 30, color: Colors.black87)),
    ]);
  }
}

class Play extends StatelessWidget {
  const Play({super.key});

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
  const Options({super.key});

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
  const musicLogo({super.key});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/redbull_logo.png?raw=true",
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      colorBlendMode: BlendMode.modulate,
      scale: 9,
    );
  }
}

class Menu extends MaterialPageRoute<void> {
  Menu()
      : super(builder: (BuildContext context) {
          MainAxisAlignment.start;
          return Scaffold(
            body: Center(
                child: Column(children: <Widget>[
              const SizedBox(height: 130),
              const GenerateRapper(),
              const SizedBox(height: 120),
              const Play(),
              Transform.translate(
                  offset: const Offset(52, -35), child: const Options()),
              const SizedBox(height: 80),
              const musicLogo(),
            ])),
            backgroundColor: const Color.fromARGB(255, 250, 226, 120),
          );
        });
}
