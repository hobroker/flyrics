import 'package:built_collection/src/map.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/models/state/track_state.dart';
import 'package:flyrics/models/track.dart';

TrackState getTrackState(AppState state) => state.track;

String getActiveTrackId(AppState state) => state.track.activeId;

String getLastActiveTrackId(state) => state.track.lastActiveId;

BuiltMap<String, Track> getTracksById(AppState state) => state.track.byId;

bool isTrackLoading(AppState state) => state.track.isLoading;

Track getActiveTrack(AppState state) {
  var activeId = getActiveTrackId(state);

  return getTracksById(state)[activeId];
}

bool hasTrack(AppState state) =>
    getActiveTrackId(state) != null && getActiveTrack(state) != null;

String getTrackName(AppState state) => getActiveTrack(state)?.name;

String getTrackArtist(AppState state) => getActiveTrack(state)?.artist;

String getTrackArtwork(AppState state) => getActiveTrack(state)?.artwork;

bool trackHasArtwork(AppState state) => getActiveTrack(state)?.artwork != null;
