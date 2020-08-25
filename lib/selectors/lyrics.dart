import 'package:flyrics/models/lyrics_model.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/models/state/lyrics_state.dart';
import 'package:flyrics/selectors/track.dart';

LyricsState getLyricsState(AppState state) => state.lyrics;

Map getLyricsById(AppState state) => getLyricsState(state).byId;

LyricsModel getActiveLyrics(AppState state) {
  var activeId = getActiveTrackId(state);

  return getLyricsById(state)[activeId];
}

String getLyricsText(AppState state) => getActiveLyrics(state)?.text;

bool hasActiveTrackLyrics(AppState state) => getLyricsText(state) != null;

bool areLyricsLoading(AppState state) => getLyricsState(state).isLoading;
