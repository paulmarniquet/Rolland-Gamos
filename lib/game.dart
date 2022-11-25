import 'dart:async';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:spotify/spotify.dart' as spotifyPackage;
import 'package:spotify/spotify.dart';
import 'buttons.dart';
import 'menu.dart';

TextEditingController _controller = TextEditingController();
final credentials = spotifyPackage.SpotifyApiCredentials(
    "3228f6206cdd4904a718518733d81770", "29665fe927ef4beda76b3a37f2456558");

class PictureWidget extends StatefulWidget {
  const PictureWidget({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _PictureWidgetState createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {
  final spotifyApi = spotifyPackage.SpotifyApi(credentials);

  getPicture() async {
    final spotifyApi = spotifyPackage.SpotifyApi(credentials);
    var search = await spotifyApi.search
        .get(GlobalData.rapname, types: [SearchType.artist], market: "FR")
        .first(1)
        // ignore: avoid_print, invalid_return_type_for_catch_error
        .catchError((err) => print((err as SpotifyException).message));
    String id = "";

    for (var pages in search) {
      for (var item in pages.items!) {
        if (item is Artist) {
          id = item.id.toString();
          return id;
        }
      }
    }
  }

  Future<String?> getImage() async {
    String id = await getPicture();
    var artiste = await spotifyApi.artists.get(id);
    String? image = artiste.images![0].url;
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getImage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return image.Image.network(snapshot.data.toString(),
                width: 175, height: 175);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class PlayPage extends MaterialPageRoute<void> {
  PlayPage()
      : super(builder: (BuildContext context) {
          MainAxisAlignment.start;
          return Scaffold(
            body: Center(
                child: Column(children: <Widget>[
              const OptionButton(),
              const SizedBox(height: 40),
              const TimerWidget(),
              const SizedBox(height: 50),
              SizedBox(
                  width: 250,
                  height: 250,
                  child: Column(children: [
                    const PictureWidget(),
                    const SizedBox(height: 20),
                    Text(GlobalData.rapname,
                        style: const TextStyle(fontFamily: 'SansSerif2')),
                  ])),
              const SizedBox(height: 60),
              SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        filled: true,
                        fillColor: Colors.white70),
                    controller: _controller,
                  )),
            ])),
            backgroundColor: const Color.fromARGB(255, 250, 226, 120),
          );
        });
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int timeleft = 30;
  int timeOnPage = 0;

  void startcountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeleft != 0) {
        setState(() {
          timeleft--;
        });
      } else {
        setState(() {
          timer.cancel();
        });
      }
    });
  }

  void timeOnPageFunc() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeOnPage++;
      if (timeOnPage == 1) {
        startcountdown();
      }
    });
  }

  void resetcountdown() {
    setState(() {
      timeleft = 30;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeOnPageFunc();
    return Column(children: [
      Text(
        timeleft == 0 ? 'Loser' : timeleft.toString(),
        style: const TextStyle(fontSize: 70, fontFamily: 'SemiThin'),
      ),
    ]);
  }
}
