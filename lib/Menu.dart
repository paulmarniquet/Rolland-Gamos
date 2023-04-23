import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:animator/animator.dart';
import 'package:flutter/services.dart';
import 'Buttons.dart';
import 'package:flutter/material.dart';
import 'GenerateRapperWidget.dart';
import 'Multiplayer.dart';

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
            image: AssetImage('assets/images/backgroundanim.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(children: <Widget>[
              const SizedBox(height: 120),
              //GenerateRapper(),
              Animator(
                cycles: 100000,
                tween: Tween<double>(begin: 1.1, end: 1.0),
                duration: const Duration(seconds: 10),
                curve: Curves.easeInOut,
                builder: (context, animatorState, child) {
                  return Transform.scale(
                    scale: animatorState.value,
                    child: Image.asset('assets/images/logo.png', scale: 8),
                  );
                },
              ),
              const Multiplayer(),
              const SizedBox(height: 30),
              const Play(),
            ]),
          ),
        ),
      ),
    );
  }
}
