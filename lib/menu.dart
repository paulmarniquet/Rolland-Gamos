import 'dart:convert';
import "game.dart";
import 'options.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GenerateRapper extends StatelessWidget {
  const GenerateRapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GestureDetector(
      onTap: () {
        //
      },
      child: Image.network(
        "https://cdn-icons-png.flaticon.com/512/3031/3031710.png",
        scale: 9,
      ))
    ]);
  }
}

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, PlayPage());
            },
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/jouerbutton.png?raw=true",
                scale: 2.5)));
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
            child: Image.network(
                "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/niveaubutton.png?raw=true",
                scale: 2.8)));
  }
}

// ignore: camel_case_types
class musicLogo extends StatelessWidget {
  const musicLogo({super.key});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://github.com/paulmarniquet/Rolland-Gamos/blob/master/assets/images/redbull_logo.png?raw=true",
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      colorBlendMode: BlendMode.modulate,
      scale: 9,
    );
  }
}

class Menu extends MaterialPageRoute<void> {

  Menu(): super(builder: (BuildContext context) {

    late Future<Album> futureAlbum;
    
          MainAxisAlignment.start;
          return Scaffold(
            body: Center(
                child: Column(children: <Widget>[
              const SizedBox(height: 150),
          //   FutureBuilder<Album>(
          //     future: fetchAlbum(),
          //     builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Text(snapshot.data!.title);
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //     return const CircularProgressIndicator();
          //   },
          // ),
              const Text("RAPPEUR", 
              style: TextStyle(fontFamily: 'SansSerif', fontSize: 30, color: Colors.white)),

              const SizedBox(height: 60),
              //GenerateRapper(),
              const SizedBox(height: 100),
              const Play(),
              Transform.translate(offset: const Offset(52, -35), child: const Options()),
              const SizedBox(height: 80),
              const musicLogo(),
            ])),
            backgroundColor: const Color.fromARGB(255, 250, 226, 120),
          );
        });
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}