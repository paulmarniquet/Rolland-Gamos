import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';


class GlobalData {
  static String rapname = "";
  static int difficulty = 1;
  static int score = 0;
  static List<String> randomRappersAni = ["Laylow", "Nekfeu", "Lesram"];
  static List<String> rappers = [];
  static bool diff1 = false;
  static bool diff2 = false;
  static bool diff3 = false;
  static TextEditingController controller = TextEditingController();
  static AudioPlayer buttonPlayer = AudioPlayer();
  static final buttonSound = AssetSource("sound/button.mp3");
}

class GenerateRapper extends StatefulWidget {
  const GenerateRapper({super.key});
  @override
  State<GenerateRapper> createState() => _GenerateRapperState();
}

class _GenerateRapperState extends State<GenerateRapper> {
  String textFromFile = "";
  int timeOnPage = 0;
  List<String> array = [];

  getData() async {
    String response;
    response = await rootBundle.loadString('assets/database');
    LineSplitter.split(response).forEach((line) => (array.add(line)));
    GlobalData.randomRappersAni = array;
    setState(() {
      textFromFile = array[Random().nextInt(array.length)];
      GlobalData.rapname = textFromFile;
      GlobalData.rappers.add(textFromFile);
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
    var timeStream = Stream.periodic(const Duration(milliseconds: 200));
    timeOnPageFunc();
    return Column(children: [
      const SizedBox(height: 50),
      StreamBuilder(
        stream: timeStream,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
                Text(textFromFile,
                  style: const TextStyle(
                      fontFamily: 'SansSerif', fontSize: 40, color: Colors.black87));
                print(textFromFile);
            },
            child: Text(GlobalData.randomRappersAni[Random().nextInt(GlobalData.randomRappersAni.length)],
                style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'SansSerif',
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          );
        },
      ),
    ]);
  }
}
