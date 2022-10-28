import 'package:flutter/material.dart';
import 'options.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(280, 40, 0, 0),
        child: GestureDetector(
            onTap: () {
                Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                },
            child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/2920/2920665.png",
                width: 40,
                height: 40)));
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(280, 40, 0, 0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, OptionsPage());
            },
            child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/2099/2099174.png",
                width: 40,
                height: 40)));
  }
}