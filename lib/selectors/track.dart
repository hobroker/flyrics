import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/models/new/track_state.dart';
import 'package:flyrics/models/track.dart';

TrackState getTrackState(AppState state) => state.track;

String getActiveTrackId(AppState state) => state.track.activeId;

Map getTracksById(AppState state) => state.track.byId;

Track getActiveTrack(AppState state) {
  var activeId = getActiveTrackId(state);

  return getTracksById(state)[activeId];
}

bool hasTrack(AppState state) {
  var track = getActiveTrack(state);

  return track != null && !track.isEmpty();
}

String getTrackName(AppState state) => getActiveTrack(state)?.name;

String getTrackArtist(AppState state) => getActiveTrack(state)?.artist;

String getTrackArtwork(AppState state) => getActiveTrack(state)?.artwork;

bool trackHasArtwork(AppState state) => getActiveTrack(state)?.artwork != null;
