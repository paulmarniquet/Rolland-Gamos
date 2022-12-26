import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "Menu.dart";
import 'package:animator/animator.dart';
import 'package:audioplayers/src/audioplayer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();
    final song = AssetSource("sound/can.mp3");
    player.setVolume(0.1);
    player.setSource(song);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 248, 240, 203),
            body: Center(
                child: Stack(children: [
      GestureDetector(
        onTap: () {
          player.play(song);
          Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, _) {
            return const Menu();
          }, transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          }, transitionDuration: const Duration(milliseconds: 500)));
        },
        child: Animator(builder: (context, animatorState, child) {
          return Opacity(
              opacity: animatorState.value,
              child: Image.asset(
                "assets/images/logo.png",
                width: 300,
                height: 300,
              ));
        }, tween: Tween<double>(begin: 0, end: 1), cycles: 1 ,duration: const Duration(milliseconds: 1600)),
      )
    ])))
    );
  }
}