import 'package:flutter/material.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/models/state/artwork_state.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/utils/ux.dart';

ArtworkState getArtworkState(AppState state) => state.artwork;

Map getArtworkById(AppState state) => getArtworkState(state).byId;

ArtworkModel getActiveArtwork(AppState state) {
  var activeId = getActiveTrackId(state);

  return getArtworkById(state)[activeId];
}

ArtworkModel getLastActiveArtwork(AppState state) {
  var lastActiveId = getLastActiveTrackId(state);

  return getArtworkById(state)[lastActiveId];
}

String getArtworkUrl(AppState state) => getActiveArtwork(state)?.url;

List<int> getTrackArtworkAsBytes(AppState state) =>
    getActiveArtwork(state)?.bytes;

bool activeTrackHasArtworkBytes(AppState state) =>
    getTrackArtworkAsBytes(state) != null;

bool isArtworkLoading(AppState state) => getArtworkState(state).isLoading;

Color getArtworkLastDominantColor(AppState state) =>
    getLastActiveArtwork(state)?.dominantColor;

Color getArtworkDominantColor(AppState state) =>
    getActiveArtwork(state)?.dominantColor;

List<Color> getArtworkColors(AppState state) => getActiveArtwork(state)?.colors;

bool artworkHasColors(AppState state) =>
    getActiveArtwork(state)?.colors?.isNotEmpty ?? false;

Color getArtworkColorByIndex(AppState state, int index) =>
    artworkHasColors(state) ? getArtworkColors(state)[index] : null;

Color getArtworkTextColor(AppState state) => getActiveArtwork(state)?.textColor;

Color resolvedDominantColor(AppState state) =>
    getArtworkDominantColor(state) ??
    getArtworkLastDominantColor(state) ??
    UX.primaryColor;

Color resolveArtworkTextColor(AppState state) =>
    getArtworkTextColor(state) ?? UX.textColor;
