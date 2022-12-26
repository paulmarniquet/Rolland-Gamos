import 'Buttons.dart';
import 'package:flutter/material.dart';
import 'GenerateRapperWidget.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});
  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.start;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Center(
              child: Column(children: const <Widget>[
            SizedBox(height: 190),
            GenerateRapper(),
            SizedBox(height: 60),
            Play(),
            SizedBox(height: 100),
            musicLogo(),
          ])),
          //backgroundColor: const Color.fromARGB(255, 250, 226, 120),
        ));
  }
}
