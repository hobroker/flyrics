import 'package:flutter/material.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/models/state/artwork_state.dart';
import 'package:flyrics/selectors/track.dart';

ArtworkState getArtworkState(AppState state) => state.artwork;

Map getArtworkById(AppState state) => getArtworkState(state).byId;

ArtworkModel getActiveArtwork(AppState state) {
  var activeId = getActiveTrackId(state);

  return getArtworkById(state)[activeId];
}

String getArtworkUrl(AppState state) => getActiveArtwork(state)?.url;

List<int> getTrackArtworkAsBytes(AppState state) =>
    getActiveArtwork(state)?.bytes;

bool activeTrackHasArtworkBytes(AppState state) =>
    getTrackArtworkAsBytes(state) != null;

bool isArtworkLoading(AppState state) => getArtworkState(state).isLoading;

Color getArtworkDominantColor(AppState state) =>
    getActiveArtwork(state)?.dominantColor;

List<Color> getArtworkColors(AppState state) => getActiveArtwork(state)?.colors;

bool artworkHasColors(AppState state) {
  var length = getActiveArtwork(state)?.colors?.length;
  return length != null && length > 1;
}

Color getArtworkColorByIndex(AppState state, int index) =>
    artworkHasColors(state) ? getArtworkColors(state)[index] : null;

Color getArtworkTextColor(AppState state) => getActiveArtwork(state)?.textColor;
