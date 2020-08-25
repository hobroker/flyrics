import 'package:flutter/material.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/models/track.dart';
import 'package:flyrics/models/track_state.dart';

bool isTrackLoading(AppState state) => state == null;

TrackState getTrackState(AppState state) => state.trackState;

Track getTrack(AppState state) => getTrackState(state).track;

bool hasTrack(AppState state) {
  var track = getTrack(state);
  return track != null && track.name != null;
}

String getTrackArtwork(AppState state) => getTrack(state)?.artwork;

List<int> getTrackArtworkAsBytes(AppState state) =>
    getTrackState(state).artworkBytes;

bool isArtworkLoaded(AppState state) => getTrackArtworkAsBytes(state) != null;

String getTrackName(AppState state) => getTrack(state)?.name;

String getTrackArtist(AppState state) => getTrack(state)?.artist;

Color getArtworkBackgroundColor(AppState state) =>
    getTrackState(state).backgroundColor;

Color getArtworkTextColor(AppState state) => getTrackState(state).textColor;

bool shouldUpdateArtwork(AppState state) =>
    getTrackState(state).shouldUpdateArtwork;
