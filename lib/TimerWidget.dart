import 'dart:async';
import 'package:flutter/material.dart';

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
      } else {
        setState(() {
          timer.cancel();
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
        timeleft == 0 ? 'Loser' : timeleft.toString(),
        style: const TextStyle(fontSize: 70, fontFamily: 'SemiThin'),
      ),
    ]);
  }
}