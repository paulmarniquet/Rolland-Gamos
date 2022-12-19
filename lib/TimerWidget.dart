import 'dart:async';
import 'package:featurine/GenerateRapperWidget.dart';
import 'package:flutter/material.dart';

import 'menu.dart';


class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}


class _TimerWidgetState extends State<TimerWidget> {

  int timeLeft = 60;
  int timeOnPage = 0;
  bool launched = false;
  bool newGame = false;


  void check_difficulty() {
    if (GlobalData.difficulty == 1 && !launched) {
      timeLeft = 30;
      launched = true;
    } else if (GlobalData.difficulty == 2 && !launched) {
      timeLeft = 60;
      launched = true;
    } else if (GlobalData.difficulty == 3 && !launched) {
      timeLeft = 90;
      launched = true;
    }
  }

  void startcountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft != 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        setState(() {
          timer.cancel();
        });
      }
    });
  }

  void timeOnPageFunc() {
    Timer.periodic(const Duration(microseconds: 1), (timer) {
      timeOnPage++;
      if (timeOnPage == 1) {
        startcountdown();
      }
    });
  }

  void checkTime() {
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (timeLeft == 0 && !newGame) {
        resetGame();
      }
    });
  }

  void resetGame() {
        GlobalData.rapname = "";
        GlobalData.difficulty = 1;
        timeLeft = 60;
        timeOnPage = 0;
        GlobalData.score = 0;
        launched = false;
        newGame = true;
        Navigator.push(context, Menu());
        alertDialog();
  }

  void alertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Time's up!"),
          content: const Text("T'as plus de temps !"),
          actions: [
            TextButton(
              child: const Text("Recommence"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    check_difficulty();
    timeOnPageFunc();
    checkTime();
    return Column(children: [
      Text(
        timeLeft == 0 ? 'Loser' : timeLeft.toString(),
        style: const TextStyle(fontSize: 70, fontFamily: 'SemiThin'),
      ),
    ]);
  }
}