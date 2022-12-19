import 'buttons.dart';
import 'package:flutter/material.dart';
import 'GenerateRapperWidget.dart';

class Menu extends MaterialPageRoute<void> {
  Menu() : super(builder: (BuildContext context) {
          MainAxisAlignment.start;
          return Scaffold(
            body: Center(
                child: Column(children: <Widget>[
              const SizedBox(height: 130),
              const GenerateRapper(),
              const SizedBox(height: 120),
              const Play(),
              Transform.translate(
                  offset: const Offset(52, -35), child: const Options()),
              const SizedBox(height: 80),
              const musicLogo(),
            ])),
            backgroundColor: const Color.fromARGB(255, 250, 226, 120),
          );
        });
}
