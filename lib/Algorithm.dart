import 'dart:async';
import 'dart:ffi';

import 'package:featurine/GenerateRapperWidget.dart';
import 'package:flutter/material.dart';
import 'PictureWidget.dart';
import 'package:spotify/spotify.dart' as spotifyPackage;
import 'package:spotify/spotify.dart';
import 'game.dart';


String get rapname => GlobalData.rapname;
String get userinput => controller.text;

String capitalize(String value) {
  var result = value[0].toUpperCase();
  bool cap = true;
  for (int i = 1; i < value.length; i++) {
    if (value[i - 1] == " " && cap == true) {
      result = result + value[i].toUpperCase();
    } else {
      result = result + value[i];
      cap = false;
    }
  }
  return result;
}

String formatInput(String controllerInput) {
  String formattedInput = controllerInput.toLowerCase();
  formattedInput = capitalize(formattedInput);

  if (formattedInput[formattedInput.length - 1] == " ") {
    formattedInput = formattedInput.substring(0, formattedInput.length - 1);
  }

  return formattedInput;
}

Future<bool> getText() async {
    final spotifyApi = spotifyPackage.SpotifyApi(credentials);
    var check = await spotifyApi.search.get("$rapname $userinput", types: [SearchType.track], market: "FR").first(1);
    String id = "";
    Future<bool> featured = Future<bool>.value(false);
    String artistInput = userinput;
    artistInput = formatInput(userinput);

    print(artistInput);

    for (var pages in check) {
      for (var item in pages.items!) {
        if (item is Track) {
          id = item.id.toString();
          var track = await spotifyApi.tracks.get(id);
          for (var artist in track.artists!) {
            if (artist.name == artistInput || artist.name == artistInput.toUpperCase()) {
              featured = Future<bool>.value(true);
            }
          }
        }
      }
    }
    return featured;
  }
