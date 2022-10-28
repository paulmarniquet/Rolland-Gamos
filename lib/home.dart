import 'package:flutter/material.dart';
import "menu.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 248, 240, 203),
            body: Center(
                child: Stack(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(context, Menu());
        },
        child: Image.network(
              "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/logo.png?raw=true",
              width: 300,
              height: 300),
      )
    ])))
    );
  }
}
