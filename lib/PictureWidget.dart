import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:spotify/spotify.dart' as spotifyPackage;
import 'package:spotify/spotify.dart';
import 'GenerateRapperWidget.dart';

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