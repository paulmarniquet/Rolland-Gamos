import 'package:flutter/material.dart';
import 'buttons.dart';
import 'PictureWidget.dart';
import 'TimerWidget.dart';
import 'GenerateRapperWidget.dart';

TextEditingController _controller = TextEditingController();

class PlayPage extends MaterialPageRoute<void> {
  PlayPage()
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
                    controller: _controller,
                  )),
            ])),
            backgroundColor: const Color.fromARGB(255, 250, 226, 120),
          );
        });
}
