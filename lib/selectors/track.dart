import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/models/track.dart';

bool isTrackLoading(AppState state) => state == null;

Track getTrack(AppState state) => state.track;

bool hasTrack(AppState state) => getTrack(state) != null;

String getTrackArtwork(AppState state) => getTrack(state)?.artwork;
