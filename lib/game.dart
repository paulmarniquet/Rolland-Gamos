import 'dart:ffi';

import 'package:featurine/Algorithm.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';
import 'PictureWidget.dart';
import 'TimerWidget.dart';
import 'GenerateRapperWidget.dart';
import 'package:web_scraper/web_scraper.dart';
import 'Algorithm.dart';

TextEditingController controller = TextEditingController();

class PlayPage extends MaterialPageRoute<void> {
  PlayPage(rapname)
      : super(builder: (BuildContext context) {
          MainAxisAlignment.start;
          return Scaffold(
            body: Center(
                child: Column(children: <Widget>[
              const OptionButton(),
              const SizedBox(height: 40),
              const TimerWidget(),
              const SizedBox(height: 50),
              SizedBox(
                  width: 250,
                  height: 250,
                  child: Column(children: [
                    const PictureWidget(),
                    const SizedBox(height: 20),
                    Text(GlobalData.rapname,
                        style: const TextStyle(fontFamily: 'SansSerif2')),
                  ])),
              const SizedBox(height: 60),
              SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        filled: true,
                        fillColor: Colors.white70),
                    controller: controller,
                  )),
                  TextButton(onPressed: (() async {
                    bool featured = await getText();
                    if (featured == true) {
                      GlobalData.rapname = controller.text;
                      GlobalData.rapname = formatInput(GlobalData.rapname);
                      controller.clear();
                      Navigator.push(context, PlayPage(GlobalData.rapname));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Correct!'),),
                          );
                    } else {
                      controller.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Incorrect!'),
                        ),
                      );
                    }
                  }
                  ), child: const Text("Envoie")),
                  Text(controller.text, style: const TextStyle(fontSize: 40)),
            ])),
            backgroundColor: const Color.fromARGB(255, 250, 226, 120),
          );
        });
}
