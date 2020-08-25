import 'package:flutter/material.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/models/artwork_state.dart';

ArtworkState getArtworkState(AppState state) => state.artworkState;

String getArtworkUrl(AppState state) => getArtworkState(state)?.url;

bool shouldUpdateArtwork(AppState state) =>
    getArtworkState(state).shouldRefresh;

List<int> getTrackArtworkAsBytes(AppState state) =>
    getArtworkState(state).bytes;

bool isArtworkLoaded(AppState state) => getTrackArtworkAsBytes(state) != null;

bool shouldDisplayArtwork(AppState state) =>
    isArtworkLoaded(state) && !shouldUpdateArtwork(state);

Color getArtworkDominantColor(AppState state) =>
    getArtworkState(state).dominantColor;

Color getArtworkTextColor(AppState state) => getArtworkState(state).textColor;
