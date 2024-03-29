import 'dart:async';
import 'package:Roland_Gamos/GenerateRapperWidget.dart';
import 'package:Roland_Gamos/Multiplayer.dart';
import 'package:flutter/material.dart';
import 'Menu.dart';

TextStyle textStyle = const TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    color: Colors.black87,
    fontSize: 20);

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});
  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int timeLeft = 60;
  int timeOnPage = 0;
  bool launched = false;
  bool newGame = false;

  void checkDifficulty() {
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
          resetGame();
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

  void resetGame() {
    GlobalData.rapname = "";
    GlobalData.controller.clear();
    launched = false;
    newGame = true;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Menu()));
    if (players.length == 1) {
      alertDialog();
    } else {
      showScores();
    }
  }

  void showScores() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            AlertDialog(
              shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  1),
              title: const Text(""),
              backgroundColor: const Color.fromRGBO(255, 250, 226, 1),
              content: Text("${players[GlobalData.player]} a perdu !\n\nScore : ${GlobalData.score}",
                  style: textStyle, textAlign: TextAlign.center),
              actions: [
                TextButton(
                  child: const Text("Recommence"),
                  onPressed: () {
                    GlobalData.score = 0;
                    GlobalData.rappers.clear();
                    GlobalData.buttonPlayer.play(GlobalData.buttonSound);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Positioned(
              top: 220,
              child: Image.asset('assets/images/logo.png', height: 70),
            ),
          ],
        );
      },
    );
  }

  void alertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            AlertDialog(
              shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  1),
              title: const Text(""),
              backgroundColor: const Color.fromRGBO(255, 250, 226, 1),
              content: GlobalData.score == 0
                  ? Text("Score : 0\n\nT'es finito..",
                      style: textStyle, textAlign: TextAlign.center)
                  : Text(
                          "Score : ${GlobalData.score}"
                          "\n\nTu as trouvé ${GlobalData.rappers.length - 1} rappeur(s)",
                          style: textStyle,
                          textAlign: TextAlign.center),
              actions: [
                TextButton(
                  child: const Text("Recommence"),
                  onPressed: () {
                    GlobalData.score = 0;
                    GlobalData.rappers.clear();
                    GlobalData.buttonPlayer.play(GlobalData.buttonSound);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Positioned(
              top: 220,
              child: Image.asset('assets/images/logo.png', height: 70),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    checkDifficulty();
    timeOnPageFunc();
    return Column(children: [
      Text(
        timeLeft.toString(),
        style: const TextStyle(fontSize: 70, fontFamily: 'SemiThin'),
      ),
    ]);
  }
}
