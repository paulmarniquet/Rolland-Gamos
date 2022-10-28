import 'dart:async';
import 'package:featurine/main.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';
import 'menu.dart';

class PlayPage extends MaterialPageRoute<void> {
  PlayPage()
      : super(builder: (BuildContext context) {
          MainAxisAlignment.start;
          return Scaffold(
            body: Center(
                child: Column(children: <Widget>[
              OptionButton(),
              const SizedBox(height: 60),
              TimerWidget(),
              const SizedBox(height: 50),
              Text("Rappeur"),
              const SizedBox(height: 80),
              const TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 150),
              musicLogo(),
            ])),
            backgroundColor: Color.fromARGB(255, 248, 214, 63),
          );
        });
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int timeleft = 30;
  int timeOnPage = 0;

  void startcountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeleft != 0) {
        setState(() {
          timeleft--;
        });
      }
    });
  }

  void timeOnPageFunc() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeOnPage++;
      if (timeOnPage == 1) {
        startcountdown();
      }
    });
  }

  void resetcountdown() {
    setState(() {
      timeleft = 30;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeOnPageFunc();
    return Column(children: [
      Text(
        timeleft == 0 ? 'Dommage' : timeleft.toString(),
        style: const TextStyle(fontSize: 70),
      ),
    ]);
  }
}
