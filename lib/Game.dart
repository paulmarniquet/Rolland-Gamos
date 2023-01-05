import 'package:audioplayers/audioplayers.dart';
import 'package:Roland_Gamos/Algorithm.dart';
import 'package:flutter/material.dart';
import 'Multiplayer.dart';
import 'PictureWidget.dart';
import 'TimerWidget.dart';
import 'GenerateRapperWidget.dart';

AudioPlayer falseResponse = AudioPlayer();
final falseSound = AssetSource("sound/incorrect.mp3");
AudioPlayer validResponse = AudioPlayer();
final validSound = AssetSource("sound/correct.mp3");

void scoreDiff() {
  if (GlobalData.difficulty == 1) {
    GlobalData.score += 3;
  } else if (GlobalData.difficulty == 2) {
    GlobalData.score += 2;
  } else if (GlobalData.difficulty == 3) {
    GlobalData.score += 1;
  }
}

bool checkRapperName(String name) {
  for (int i = 0; i < GlobalData.rappers.length; i++) {
    if (name == GlobalData.rappers[i]) {
      return true;
    }
  }
  return false;
}

class PlayPage extends MaterialPageRoute<void> {
  PlayPage(rapname, player)
      : super(builder: (BuildContext context) {
          validResponse.setVolume(0.1);
          validResponse.setSource(validSound);
          falseResponse.setVolume(0.2);
          falseResponse.setSource(falseSound);
          MainAxisAlignment.start;
          return WillPopScope(
              onWillPop: () async => false,
              child: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Scaffold(
                      backgroundColor: player == 0
                          ? Colors.amberAccent[100]
                          : player == 1
                              ? Colors.orange[200]
                              : Colors.red[300],
                      body: SingleChildScrollView(
                        child: Center(
                            child: Column(children: <Widget>[
                          const SizedBox(height: 110),
                          const TimerWidget(),
                          const SizedBox(height: 50),
                          SizedBox(
                              width: 250,
                              height: 250,
                              child: Column(children: [
                                const PictureWidget(),
                                Container(
                                    width: GlobalData.rapname.length > 10
                                        ? 200
                                        : 150,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(0, 9))
                                        ]),
                                    child: Center(
                                        child: Text(GlobalData.rapname,
                                            style: TextStyle(
                                                fontSize:
                                                    GlobalData.rapname.length >
                                                            10
                                                        ? 17
                                                        : 20,
                                                fontFamily: 'SansSerif2',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)))),
                              ])),
                          const SizedBox(height: 20),
                          SizedBox(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: (() async {
                                          bool featured = await getText();
                                          if (featured == true &&
                                              !checkRapperName(formatInput(
                                                  GlobalData
                                                      .controller.text))) {
                                            validResponse.play(validSound);
                                            scoreDiff();
                                            GlobalData.rapname =
                                                GlobalData.controller.text;
                                            GlobalData.rapname =
                                                formatInput(GlobalData.rapname);
                                            GlobalData.rappers
                                                .add(GlobalData.rapname);
                                            GlobalData.controller.clear();
                                            player != players.length - 1
                                                ? Navigator.pushReplacement(
                                                    context,
                                                    PlayPage(GlobalData.rapname,
                                                        player += 1))
                                                : Navigator.pushReplacement(
                                                    context,
                                                    PlayPage(GlobalData.rapname,
                                                        player = 0));
                                            GlobalData.player = player;
                                          } else {
                                            falseResponse.play(falseSound);
                                            GlobalData.controller.clear();
                                            GlobalData.player = player;
                                          }
                                        }),
                                        icon: const Icon(Icons.check)),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0))),
                                    filled: true,
                                    fillColor: Colors.white70),
                                controller: GlobalData.controller,
                              )),
                          const SizedBox(height: 100),
                          players.length == 1
                              ? Text(GlobalData.score.toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Mont22',
                                      letterSpacing: 5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                              : Text(players[player],
                                  style: const TextStyle(
                                      fontFamily: 'Mont22',
                                      letterSpacing: 10,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                        ])),
                      ))));
        });
}
