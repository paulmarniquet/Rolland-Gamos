import 'package:flutter/material.dart';
import "menu.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 248, 240, 203),
            body: Center(
                child: Stack(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(context, Menu());
        },
        child: Image.asset(
              "assets/images/logo.png",
              width: 300,
              height: 300),
      )
    ])))
    );
  }
}
