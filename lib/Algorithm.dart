import 'dart:async';
import 'package:featurine/GenerateRapperWidget.dart';
import 'PictureWidget.dart';
import 'package:spotify/spotify.dart' as spotifyPackage;
import 'package:spotify/spotify.dart';

String get rapname => GlobalData.rapname;
String get userinput => GlobalData.controller.text;

String capitalizeNames(String input) {
  final List<String> splitStr = input.split(' ');
  for (int i = 0; i < splitStr.length; i++) {
    splitStr[i] =
    '${splitStr[i][0].toUpperCase()}${splitStr[i].substring(1)}';
  }
  final output = splitStr.join(' ');
  return output;
}

String formatInput(String controllerInput) {
  String formattedInput = controllerInput.toLowerCase();
  formattedInput = capitalizeNames(formattedInput);

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
    String artistInput = formatInput(userinput);
    
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
