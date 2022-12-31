import 'GenerateRapperWidget.dart';
import 'package:flutter/material.dart';
import 'Options.dart';

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalData.buttonPlayer.setVolume(0.2);
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: GestureDetector(
            onTap: () {
              GlobalData.buttonPlayer.play(GlobalData.buttonSound);
              Navigator.push(context, OptionsPage());
            },
            child: Image.asset("assets/images/unknown.png", scale: 2.5)
        ));
  }
}

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, OptionsPage());
            },
            child: Image.asset("assets/images/niveaubutton.png", scale: 2.8)));
  }
}

class musicLogo extends StatelessWidget {
  const musicLogo({super.key});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/redbull_logo.png",
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      colorBlendMode: BlendMode.modulate,
      scale: 9,
    );
  }
}

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(280, 40, 0, 0),
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
