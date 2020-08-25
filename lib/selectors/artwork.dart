import 'package:flutter/material.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/models/artwork_state.dart';

ArtworkState getArtworkState(AppState state) => state.artwork;

String getArtworkUrl(AppState state) => getArtworkState(state)?.url;

List<int> getTrackArtworkAsBytes(AppState state) =>
    getArtworkState(state).bytes;

bool isArtworkLoading(AppState state) => getArtworkState(state).isLoading;

bool isArtworkMissing(AppState state) =>
    getArtworkUrl(state) == null && !isArtworkLoading(state);

Color getArtworkDominantColor(AppState state) =>
    getArtworkState(state)?.dominantColor;

List<Color> getArtworkColors(AppState state) => getArtworkState(state)?.colors;

bool artworkHasColors(AppState state) {
  var length = getArtworkState(state)?.colors?.length;
  return length != null && length > 1;
}

Color getArtworkColorByIndex(AppState state, int index) =>
    artworkHasColors(state) ? getArtworkColors(state)[index] : null;

Color getArtworkTextColor(AppState state) => getArtworkState(state)?.textColor;
