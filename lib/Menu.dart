import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'Buttons.dart';
import 'package:flutter/material.dart';
import 'GenerateRapperWidget.dart';

getData() async {
  String response;
  response = await rootBundle.loadString('assets/database');
  LineSplitter.split(response)
      .forEach((line) => (GlobalData.randomRappersAni.add(line)));
}

Widget buildRapperText(List<String> rappers) {
  return Column(
    children: [
      StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 200)),
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              null;
            },
            child: Text(rappers[Random().nextInt(rappers.length)],
                style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'SansSerif',
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
          );
        },
      ),
    ],
  );
}

class Menu extends StatelessWidget {
  const Menu({super.key});
  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.start;
    getData();
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.gif'),
            opacity: 0.4,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Column(children: const <Widget>[
                    SizedBox(height: 160),
                    GenerateRapper(),
                    SizedBox(height: 60),
                    Play(),
                    SizedBox(height: 90),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
