import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'GenerateRapperWidget.dart';
import 'game.dart';

class GlobalInput {
  static final TextEditingController _controller = TextEditingController();
}

class Algorithm extends StatefulWidget {
  const Algorithm({super.key});
  @override
  _AlgorithmState createState() => _AlgorithmState();
}

class _AlgorithmState extends State<Algorithm> {


  getText() async {
    final webScraper = WebScraper('https://lescharts.com/');
    if (await webScraper.loadWebPage('/search.asp?search=Nekfeu&cat=s"')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('td.artist > a', ['href']);
      print(elements);
      print(GlobalInput._controller);
    }
    return GlobalInput._controller;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getText(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.toString(), style: const TextStyle(fontSize: 40));
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}