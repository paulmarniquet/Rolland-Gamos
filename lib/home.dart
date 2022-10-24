import 'package:flutter/material.dart';
import "menu.dart";
import 'main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Stack(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(context, PageTwo());
        },
        child: logo,
      )
    ]))));
  }
}
