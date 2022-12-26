import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import "Menu.dart";
import 'package:animator/animator.dart';

AudioPlayer player = AudioPlayer();
AudioPlayer player2 = AudioPlayer();
final canSound = AssetSource("sound/can.mp3");
final yeahSound = AssetSource("sound/yeah.mp3");

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    player.setVolume(0.1);
    player.setSource(canSound);
    player2.setVolume(0.1);
    player2.setSource(yeahSound);
    player2.play(yeahSound);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            //backgroundColor: const Color.fromARGB(255, 248, 240, 203),
            body: Center(
                child: Stack(children: [
              GestureDetector(
                onTap: () {
                  player.play(canSound);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation1, _) {
                            return const Menu();
                          },
                          transitionsBuilder:
                              (context, animation1, animation2, child) {
                            return FadeTransition(
                                opacity: animation1, child: child);
                          },
                          transitionDuration:
                              const Duration(milliseconds: 500)));
                },
                child: Animator(
                    builder: (context, animatorState, child) {
                      return Opacity(
                          opacity: animatorState.value,
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: 300,
                            height: 300,
                          ));
                    },
                    tween: Tween<double>(begin: 0, end: 1),
                    cycles: 1,
                    duration: const Duration(milliseconds: 1600)),
              )
            ]))));
  }
}
