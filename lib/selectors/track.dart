import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/models/track.dart';

Track getTrack(AppState state) => state.track;

bool hasTrack(AppState state) {
  var track = getTrack(state);
  return track != null && !track.isEmpty();
}

String getTrackName(AppState state) => getTrack(state)?.name;

String getTrackArtist(AppState state) => getTrack(state)?.artist;
