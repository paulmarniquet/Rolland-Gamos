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

  Future<bool> getText() async {
    final spotifyApi = spotifyPackage.SpotifyApi(credentials);
    var check = await spotifyApi.search
        .get("$rapname $userinput", types: [SearchType.track], market: "FR").first(1);
    // ignore: avoid_print, invalid_return_type_for_catch_error
    String id = "";
    Future<bool> featured = Future<bool>.value(false);

    for (var pages in check) {
      for (var item in pages.items!) {
        if (item is Track) {
          id = item.id.toString();
          var track = await spotifyApi.tracks.get(id);
          for (var artist in track.artists!) {
            if (artist.name == userinput) {
              featured = Future<bool>.value(true);
            } else {
              featured = Future<bool>.value(false);
            }
          }
        }
      }
    }
    return featured;
  }
