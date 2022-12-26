import 'package:audioplayers/audioplayers.dart';
import 'package:featurine/Algorithm.dart';
import 'package:flutter/material.dart';
import 'PictureWidget.dart';
import 'TimerWidget.dart';
import 'GenerateRapperWidget.dart';

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
  PlayPage(rapname)
      : super(builder: (BuildContext context) {
          GlobalData.buttonPlayer.setVolume(0.2);
          GlobalData.buttonPlayer.setSource(GlobalData.buttonSound);
          MainAxisAlignment.start;
          return WillPopScope(
              onWillPop: () async => false,
              child: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Scaffold(
                      //backgroundColor: const Color.fromARGB(255, 250, 226, 120),
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
                                const SizedBox(height: 20),
                                Text(GlobalData.rapname,
                                    style: const TextStyle(
                                        fontFamily: 'SansSerif2')),
                              ])),
                          const SizedBox(height: 20),
                          SizedBox(
                              width: 300,
                              child: TextField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0))),
                                    filled: true,
                                    fillColor: Colors.white70),
                                controller: GlobalData.controller,
                              )),
                          const SizedBox(height: 50),
                          Text(GlobalData.score.toString(),
                              style: const TextStyle(fontFamily: 'SansSerif2')),
                          TextButton(
                            onPressed: (() async {
                              bool featured = await getText();
                              if (featured == true &&
                                  !checkRapperName(formatInput(
                                      GlobalData.controller.text))) {
                                GlobalData.buttonPlayer
                                    .play(GlobalData.buttonSound);
                                scoreDiff();
                                GlobalData.rapname = GlobalData.controller.text;
                                GlobalData.rapname =
                                    formatInput(GlobalData.rapname);
                                GlobalData.rappers.add(GlobalData.rapname);
                                GlobalData.controller.clear();
                                Navigator.pushReplacement(
                                    context, PlayPage(GlobalData.rapname));
                              } else {
                                GlobalData.controller.clear();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Not featured'),
                                  ),
                                );
                              }
                            }),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text("Envoie"),
                          ),
                        ])),
                      ))));
        });
}
