import 'dart:async';
import 'package:featurine/GenerateRapperWidget.dart';
import 'package:featurine/menu.dart';
import 'package:flutter/material.dart';


class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _TimerWidgetState createState() => _TimerWidgetState();
}


class _TimerWidgetState extends State<TimerWidget> {

  int timeleft = 60;
  int timeOnPage = 0;
  bool launched = false;


  void check_difficulty() {
    if (GlobalData.difficulty == 1 && !launched) {
      timeleft = 30;
      launched = true;
    } else if (GlobalData.difficulty == 2 && !launched) {
      timeleft = 60;
      launched = true;
    } else if (GlobalData.difficulty == 3 && !launched) {
      timeleft = 90;
      launched = true;
    }
  }

  void startcountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeleft != 0) {
        setState(() {
          timeleft--;
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
      if (timeleft < 26) {
        //showDialog(context: context, builder: (BuildContext context) => defeatWidget(context));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    check_difficulty();
    timeOnPageFunc();
    checkTime();
    return Column(children: [
      Text(
        timeleft == 0 ? 'Loser' : timeleft.toString(),
        style: const TextStyle(fontSize: 70, fontFamily: 'SemiThin'),
      ),
    ]);
  }
}