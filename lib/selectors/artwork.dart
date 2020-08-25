import 'package:flutter/material.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/models/artwork_state.dart';
import 'package:flyrics/selectors/track.dart';

ArtworkState getArtworkState(AppState state) => state.artwork;

String getArtworkUrl(AppState state) => getArtworkState(state)?.url;

List<int> getTrackArtworkAsBytes(AppState state) =>
    getArtworkState(state).bytes;

bool isArtworkLoaded(AppState state) => getTrackArtworkAsBytes(state) != null;

bool isArtworkMissing(AppState state) =>
    getTrackArtworkAsBytes(state) == null && !trackHasArtwork(state);

Color getArtworkDominantColor(AppState state) =>
    getArtworkState(state)?.dominantColor;

List<Color> getArtworkColors(AppState state) => getArtworkState(state)?.colors;

bool artworkHasColors(AppState state) =>
    getArtworkState(state)?.colors?.length != 1;

Color getArtworkColorByIndex(AppState state, int index) =>
    artworkHasColors(state) ? getArtworkColors(state)[index] : null;

Color getArtworkTextColor(AppState state) => getArtworkState(state)?.textColor;
