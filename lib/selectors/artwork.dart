import 'package:flutter/material.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/constants/ux.dart';

Map getArtworkById(AppState state) => state.artwork.byId;

bool isArtworkLoading(AppState state) => state.artwork.isLoading;

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
