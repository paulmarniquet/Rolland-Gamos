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
              const SizedBox(height: 40),
              const TimerWidget(),
              const SizedBox(height: 50),
              SizedBox(
                  width: 250,
                  height: 250,
                  child: Column(children: [
                    Image.network(
                        "https://alohanews.be/wp-content/uploads/2022/03/limsa-scaled.jpg",
                        height: 175),
                    const SizedBox(height: 20),
                    const Text("RAPPEUR",
                        style: TextStyle(fontFamily: 'SansSerif2')),
                  ])),
              const SizedBox(height: 45),
              const SizedBox(
                  width: 300,
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: 'Qui a feat avec Limsa ?'))),
            ])),
            backgroundColor: Color.fromARGB(255, 250, 226, 120),
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
        timeleft == 0 ? 'Loser' : timeleft.toString(),
        style: const TextStyle(fontSize: 70),
      ),
    ]);
  }
}
