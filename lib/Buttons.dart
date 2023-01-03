import 'package:animator/animator.dart';
import 'GenerateRapperWidget.dart';
import 'package:flutter/material.dart';
import 'Options.dart';

class Play extends StatefulWidget {
  const Play() : super(key: null);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> with SingleTickerProviderStateMixin {
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
          child: Animator(
            cycles: 100000,
            tween: Tween<double>(begin: 1.2, end: 1.0),
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            builder: (context, animatorState, child) {
              return Transform.scale(
                scale: animatorState.value,
                child: Image.asset('assets/images/unknown.png', scale: 3),
              );
            },
          ),
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
