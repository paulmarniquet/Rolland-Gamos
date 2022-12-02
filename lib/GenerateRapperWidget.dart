import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
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
