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
              const SizedBox(height: 150),
              musicLogo(),
            ])),
            backgroundColor: Color.fromARGB(255, 248, 214, 63),
          );
        });
}
