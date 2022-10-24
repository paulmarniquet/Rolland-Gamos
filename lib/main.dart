//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "home.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: themeData,
  ));
}

final ThemeData themeData = ThemeData(
  canvasColor: const Color.fromARGB(255, 254, 220, 70),
);

Image logo = Image.network(
    "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/logo.png?raw=true",
    width: 300,
    height: 300);