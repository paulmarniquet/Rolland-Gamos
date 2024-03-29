import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'Game.dart';
import 'GenerateRapperWidget.dart';

class OptionsPage extends MaterialPageRoute<void> {
  OptionsPage()
      : super(builder: (BuildContext context) {
          return Scaffold(
            body: Center(
                child: Column(children: [
              const SizedBox(height: 180),
              const Text("DIFFICULTÉ",
                  style: TextStyle(
                      fontFamily: 'SansSerif',
                      fontSize: 30,
                      color: Colors.black)),
              const SizedBox(height: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  RedCan(),
                  GreenCan(),
                  BlueCan(),
                ],
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  null;
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(170, 50),
                  backgroundColor: const Color.fromARGB(255, 250, 226, 120),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_outlined,
                      color: Colors.black),
                  onPressed: () {
                    GlobalData.buttonPlayer.play(GlobalData.buttonSound);
                    Navigator.push(context,
                        PlayPage(GlobalData.rapname, GlobalData.player));
                  },
                ),
              ),
              const SizedBox(height: 60),
            ])),
            //backgroundColor: const Color.fromARGB(255, 254, 129, 106),
          );
        });
}

class BlueCan extends StatefulWidget {
  const BlueCan({super.key});

  @override
  State<BlueCan> createState() => _BlueCanState();
}

class _BlueCanState extends State<BlueCan> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 900));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              GlobalData.buttonPlayer.play(GlobalData.buttonSound);
              setState(() {
                GlobalData.diff1 = !GlobalData.diff1;
                GlobalData.diff2 = false;
                GlobalData.diff3 = false;
                if (GlobalData.diff1) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              });
              GlobalData.difficulty = 1;
            },
            child: GlobalData.diff1
                ? Animator(
                    builder: (context, animatorState, child) {
                      return Transform.rotate(
                        angle: 180,
                        child: child,
                      );
                    },
                    duration: const Duration(milliseconds: 1),
                    cycles: 1,
                    curve: Curves.easeInOut,
                    child:
                        Image.asset('assets/images/blue_can.png', scale: 3.8))
                : Image.asset('assets/images/blue_can.png', scale: 3.8),
          );
        },
      ),
      const SizedBox(height: 10),
      const Text("Difficile",
          style:
              TextStyle(fontFamily: 'Cool', fontSize: 15, color: Colors.black))
    ]);
  }
}

class GreenCan extends StatefulWidget {
  const GreenCan({super.key});

  @override
  State<GreenCan> createState() => _GreenCanState();
}

class _GreenCanState extends State<GreenCan>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 900));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              GlobalData.buttonPlayer.play(GlobalData.buttonSound);
              setState(() {
                GlobalData.diff1 = false;
                GlobalData.diff2 = !GlobalData.diff2;
                GlobalData.diff3 = false;
                if (GlobalData.diff2) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              });
              GlobalData.difficulty = 2;
            },
            child: GlobalData.diff2
                ? Animator(
                    builder: (context, animatorState, child) {
                      return Transform.rotate(
                        angle: 180,
                        child: child,
                      );
                    },
                    duration: const Duration(milliseconds: 1),
                    cycles: 1,
                    curve: Curves.easeInOut,
                    child:
                        Image.asset('assets/images/green_can.png', scale: 3.8))
                : Image.asset('assets/images/green_can.png', scale: 3.8),
          );
        },
      ),
      const SizedBox(height: 10),
      const Text("Moyen",
          style:
              TextStyle(fontFamily: 'Cool', fontSize: 15, color: Colors.black)),
    ]);
  }
}

class RedCan extends StatefulWidget {
  const RedCan({super.key});

  @override
  State<RedCan> createState() => _RedCanState();
}

class _RedCanState extends State<RedCan> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 900));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              GlobalData.buttonPlayer.play(GlobalData.buttonSound);
              setState(() {
                GlobalData.diff1 = false;
                GlobalData.diff2 = false;
                GlobalData.diff3 = !GlobalData.diff3;
                if (GlobalData.diff3) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              });
              GlobalData.difficulty = 3;
            },
            child: GlobalData.diff3
                ? Animator(
                    builder: (context, animatorState, child) {
                      return Transform.rotate(
                        angle: 180,
                        child: child,
                      );
                    },
                    duration: const Duration(milliseconds: 1),
                    cycles: 1,
                    curve: Curves.easeInOut,
                    child: Image.asset('assets/images/red_can.png', scale: 3.8))
                : Image.asset('assets/images/red_can.png', scale: 3.8),
          );
        },
      ),
      const SizedBox(height: 10),
      const Text("Facile",
          style:
              TextStyle(fontFamily: 'Cool', fontSize: 15, color: Colors.black)),
    ]);
  }
}
